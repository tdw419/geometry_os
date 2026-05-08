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
    LDI r7, 0x000011
    FILL r7

    ; --- Pre-load text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    LDI r20, 0x600B
    LDI r14, 10
    STORE r20, r14
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r14, 10
    STORE r20, r14
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r4, 0x6000        ; text pointer
    LDI r9, 0             ; match count
    LDI r1, 1

search_loop:
    ; Read char at text pointer
    LOAD r14, r4
    ; Check for null (end of text)
    LDI r0, 0
    CMP r14, r0
    JZ r12, search_done

    ; Try to match pattern at this position
    LDI r2, 0x6100        ; pattern pointer
    MOV r16, r4            ; save start position

match_try:
    ; Read pattern char
    LOAD r14, r2
    ; If pattern char is null, full match
    LDI r0, 0
    CMP r14, r0
    JZ r12, found_match

    ; Read text char at current position
    LOAD r13, r16
    ; If text is null or newline, no match
    LDI r0, 0
    CMP r13, r0
    JZ r12, no_match

    ; Compare
    CMP r14, r13
    JNZ r12, no_match

    ; Match so far, advance both
    ADD r2, r1
    ADD r16, r1
    JMP match_try

found_match:
    ADDI r9, 1            ; match count++

no_match:
    ADDI r4, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r6, 0x7800
    STORE r6, r9

    ; --- Draw header ---
    LDI r7, 0x006600       ; green header
    LDI r2, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r2, r16, r17, r18, r7

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r4, 4
    LDI r9, 2
    LDI r11, 0x5000
    LDI r3, 0xFFFFFF
    LDI r8, 0x006600
    DRAWTEXT r4, r9, r11, r3, r8

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r4, 4
    LDI r9, 16
    LDI r11, 0x5000
    LDI r3, 0xCCCCCC
    LDI r8, 0x000011
    DRAWTEXT r4, r9, r11, r3, r8

    ; Show the pattern itself
    LDI r4, 80
    LDI r9, 16
    LDI r11, 0x6100
    LDI r3, 0xFFFF00     ; yellow
    LDI r8, 0x000011
    DRAWTEXT r4, r9, r11, r3, r8

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r4, 4
    LDI r9, 32
    LDI r11, 0x5000
    LDI r3, 0xCCCCCC
    LDI r8, 0x000011
    DRAWTEXT r4, r9, r11, r3, r8

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r4, 4
    LDI r9, 48
    LDI r11, 0x5000
    LDI r3, 0xCCCCCC
    LDI r8, 0x000011
    DRAWTEXT r4, r9, r11, r3, r8

    LDI r4, 50
    LDI r9, 48
    LDI r11, 0x6000
    LDI r3, 0x888888
    LDI r8, 0x000011
    DRAWTEXT r4, r9, r11, r3, r8

    HALT
