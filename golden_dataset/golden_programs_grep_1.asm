; DESCRIPTION: Geometry OS program to draw a colored object.

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
    LDI r13, 10
    STORE r20, r13
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r13, 10
    STORE r20, r13
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r5, 0x6000        ; text pointer
    LDI r6, 0             ; match count
    LDI r2, 1

search_loop:
    ; Read char at text pointer
    LOAD r13, r5
    ; Check for null (end of text)
    LDI r14, 0
    CMP r13, r14
    JZ r1, search_done

    ; Try to match pattern at this position
    LDI r11, 0x6100        ; pattern pointer
    MOV r16, r5            ; save start position

match_try:
    ; Read pattern char
    LOAD r13, r11
    ; If pattern char is null, full match
    LDI r14, 0
    CMP r13, r14
    JZ r1, found_match

    ; Read text char at current position
    LOAD r8, r16
    ; If text is null or newline, no match
    LDI r14, 0
    CMP r8, r14
    JZ r1, no_match

    ; Compare
    CMP r13, r8
    JNZ r1, no_match

    ; Match so far, advance both
    ADD r11, r2
    ADD r16, r2
    JMP match_try

found_match:
    ADDI r6, 1            ; match count++

no_match:
    ADDI r5, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r7, 0x7800
    STORE r7, r6

    ; --- Draw header ---
    LDI r4, 0x006600       ; green header
    LDI r11, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r11, r16, r17, r18, r4

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r5, 4
    LDI r6, 2
    LDI r12, 0x5000
    LDI r9, 0xFFFFFF
    LDI r10, 0x006600
    DRAWTEXT r5, r6, r12, r9, r10

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r5, 4
    LDI r6, 16
    LDI r12, 0x5000
    LDI r9, 0xCCCCCC
    LDI r10, 0x000011
    DRAWTEXT r5, r6, r12, r9, r10

    ; Show the pattern itself
    LDI r5, 80
    LDI r6, 16
    LDI r12, 0x6100
    LDI r9, 0xFFFF00     ; yellow
    LDI r10, 0x000011
    DRAWTEXT r5, r6, r12, r9, r10

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r5, 4
    LDI r6, 32
    LDI r12, 0x5000
    LDI r9, 0xCCCCCC
    LDI r10, 0x000011
    DRAWTEXT r5, r6, r12, r9, r10

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r5, 4
    LDI r6, 48
    LDI r12, 0x5000
    LDI r9, 0xCCCCCC
    LDI r10, 0x000011
    DRAWTEXT r5, r6, r12, r9, r10

    LDI r5, 50
    LDI r6, 48
    LDI r12, 0x6000
    LDI r9, 0x888888
    LDI r10, 0x000011
    DRAWTEXT r5, r6, r12, r9, r10

    HALT
