; DESCRIPTION: Composite: Places a yellow dot at position (448, 160) then Draws a magenta line from (430, 157) to (237, 174) then Places a cyan 31x36 rectangle at position (14, 137).
; PLAN: r0=448(x), r1=160(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=430(x1), r6=157(y1), r7=237(x2), r8=174(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=14(x), r11=137(y), r12=31(width), r13=36(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 160
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 430
LDI r6, 157
LDI r7, 237
LDI r8, 174
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 14
LDI r11, 137
LDI r12, 31
LDI r13, 36
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
