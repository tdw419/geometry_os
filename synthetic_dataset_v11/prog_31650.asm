; DESCRIPTION: Composite: . Then Draws a orange rectangle at (9, 73) with width 110 and height 20. Then Places a yellow line segment connecting (71, 237) to (140, 64).
; PLAN: r0=9(x), r1=73(y), r2=110(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=71(x1), r1=237(y1), r2=140(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange rectangle at (9, 73) with width 110 and height 20.
; PLAN: r0=9(x), r1=73(y), r2=110(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 73
LDI r2, 110
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (71, 237) to (140, 64).
; PLAN: r0=71(x1), r1=237(y1), r2=140(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 237
LDI r2, 140
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
