; DESCRIPTION: Composite: Draws a purple line from (308, 227) to (448, 21) then Sets a single cyan pixel at (183, 93) then Draws a black rectangle at (399, 128) with width 27 and height 11.
; PLAN: r0=308(x1), r1=227(y1), r2=448(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=93(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=399(x), r11=128(y), r12=27(width), r13=11(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 227
LDI r2, 448
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 93
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 399
LDI r11, 128
LDI r12, 27
LDI r13, 11
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
