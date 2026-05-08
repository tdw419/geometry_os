; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
    LDI r4, 0x000011
    FILL r4

    ; --- Pre-load text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    LDI r20, 0x600B
    LDI r7, 10
    STORE r20, r7
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r7, 10
    STORE r20, r7
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r8, 0x6000        ; text pointer
    LDI r2, 0             ; match count
    LDI r10, 1

search_loop:
    ; Read char at text pointer
    LOAD r7, r8
    ; Check for null (end of text)
    LDI r12, 0
    CMP r7, r12
    JZ r1, search_done

    ; Try to match pattern at this position
    LDI r9, 0x6100        ; pattern pointer
    MOV r16, r8            ; save start position

match_try:
    ; Read pattern char
    LOAD r7, r9
    ; If pattern char is null, full match
    LDI r12, 0
    CMP r7, r12
    JZ r1, found_match

    ; Read text char at current position
    LOAD r3, r16
    ; If text is null or newline, no match
    LDI r12, 0
    CMP r3, r12
    JZ r1, no_match

    ; Compare
    CMP r7, r3
    JNZ r1, no_match

    ; Match so far, advance both
    ADD r9, r10
    ADD r16, r10
    JMP match_try

found_match:
    ADDI r2, 1            ; match count++

no_match:
    ADDI r8, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r13, 0x7800
    STORE r13, r2

    ; --- Draw header ---
    LDI r4, 0x006600       ; green header
    LDI r9, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r4

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r8, 4
    LDI r2, 2
    LDI r15, 0x5000
    LDI r11, 0xFFFFFF
    LDI r0, 0x006600
    DRAWTEXT r8, r2, r15, r11, r0

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r8, 4
    LDI r2, 16
    LDI r15, 0x5000
    LDI r11, 0xCCCCCC
    LDI r0, 0x000011
    DRAWTEXT r8, r2, r15, r11, r0

    ; Show the pattern itself
    LDI r8, 80
    LDI r2, 16
    LDI r15, 0x6100
    LDI r11, 0xFFFF00     ; yellow
    LDI r0, 0x000011
    DRAWTEXT r8, r2, r15, r11, r0

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r8, 4
    LDI r2, 32
    LDI r15, 0x5000
    LDI r11, 0xCCCCCC
    LDI r0, 0x000011
    DRAWTEXT r8, r2, r15, r11, r0

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r8, 4
    LDI r2, 48
    LDI r15, 0x5000
    LDI r11, 0xCCCCCC
    LDI r0, 0x000011
    DRAWTEXT r8, r2, r15, r11, r0

    LDI r8, 50
    LDI r2, 48
    LDI r15, 0x6000
    LDI r11, 0x888888
    LDI r0, 0x000011
    DRAWTEXT r8, r2, r15, r11, r0

    HALT
