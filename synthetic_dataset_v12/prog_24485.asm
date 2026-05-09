; DESCRIPTION: Composite: Places a white dot at position (183, 67) then Draws a magenta line from (268, 91) to (299, 19) then Places a cyan 119x57 rectangle at position (150, 13).
; PLAN: r0=183(x), r1=67(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=268(x1), r6=91(y1), r7=299(x2), r8=19(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=13(y), r12=119(width), r13=57(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 67
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 268
LDI r6, 91
LDI r7, 299
LDI r8, 19
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 13
LDI r12, 119
LDI r13, 57
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
