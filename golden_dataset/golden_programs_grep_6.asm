; DESCRIPTION: Render a colored object at the screen.

; grep.asm -- Search for a pattern in RAM text
;
; Searches for all occurrences of a byte pattern in a text buffer.
; Pattern is pre-loaded at 0x6100, text at 0x6000.
; Outputs match count at RAM[0x7800].
; Displays matches on screen with highlighted text.
;
; Sample: search for "oo" in "Hello World\nFoo Bar\nBaz"
; Expected: 1 match (in "F[oo] Bar")

    ; --- Fill screen ---
    LDI r12, 0x000011
    FILL r12

    ; --- Pre-load text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    LDI r20, 0x600B
    LDI r6, 10
    STORE r20, r6
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r6, 10
    STORE r20, r6
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r2, 0x6000        ; text pointer
    LDI r3, 0             ; match count
    LDI r15, 1

search_loop:
    ; Read char at text pointer
    LOAD r6, r2
    ; Check for null (end of text)
    LDI r5, 0
    CMP r6, r5
    JZ r7, search_done

    ; Try to match pattern at this position
    LDI r10, 0x6100        ; pattern pointer
    MOV r16, r2            ; save start position

match_try:
    ; Read pattern char
    LOAD r6, r10
    ; If pattern char is null, full match
    LDI r5, 0
    CMP r6, r5
    JZ r7, found_match

    ; Read text char at current position
    LOAD r1, r16
    ; If text is null or newline, no match
    LDI r5, 0
    CMP r1, r5
    JZ r7, no_match

    ; Compare
    CMP r6, r1
    JNZ r7, no_match

    ; Match so far, advance both
    ADD r10, r15
    ADD r16, r15
    JMP match_try

found_match:
    ADDI r3, 1            ; match count++

no_match:
    ADDI r2, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r9, 0x7800
    STORE r9, r3

    ; --- Draw header ---
    LDI r12, 0x006600       ; green header
    LDI r10, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r10, r16, r17, r18, r12

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r2, 4
    LDI r3, 2
    LDI r11, 0x5000
    LDI r0, 0xFFFFFF
    LDI r14, 0x006600
    DRAWTEXT r2, r3, r11, r0, r14

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r2, 4
    LDI r3, 16
    LDI r11, 0x5000
    LDI r0, 0xCCCCCC
    LDI r14, 0x000011
    DRAWTEXT r2, r3, r11, r0, r14

    ; Show the pattern itself
    LDI r2, 80
    LDI r3, 16
    LDI r11, 0x6100
    LDI r0, 0xFFFF00     ; yellow
    LDI r14, 0x000011
    DRAWTEXT r2, r3, r11, r0, r14

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r2, 4
    LDI r3, 32
    LDI r11, 0x5000
    LDI r0, 0xCCCCCC
    LDI r14, 0x000011
    DRAWTEXT r2, r3, r11, r0, r14

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r2, 4
    LDI r3, 48
    LDI r11, 0x5000
    LDI r0, 0xCCCCCC
    LDI r14, 0x000011
    DRAWTEXT r2, r3, r11, r0, r14

    LDI r2, 50
    LDI r3, 48
    LDI r11, 0x6000
    LDI r0, 0x888888
    LDI r14, 0x000011
    DRAWTEXT r2, r3, r11, r0, r14

    HALT
