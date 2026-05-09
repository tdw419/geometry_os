; DESCRIPTION: Composite: Places a blue dot at position (348, 42) then Places a white 13x101 rectangle at position (376, 66) then Draws a magenta line from (229, 220) to (307, 183).
; PLAN: r0=348(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=66(y), r7=13(width), r8=101(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x1), r11=220(y1), r12=307(x2), r13=183(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 66
LDI r7, 13
LDI r8, 101
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 220
LDI r12, 307
LDI r13, 183
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
