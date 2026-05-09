; DESCRIPTION: Composite: . Then Draws a orange line from (77, 251) to (119, 52). Then Draws a yellow rectangle at (164, 54) with width 81 and height 120.
; PLAN: r0=77(x1), r1=251(y1), r2=119(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=164(x), r1=54(y), r2=81(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (77, 251) to (119, 52).
; PLAN: r0=77(x1), r1=251(y1), r2=119(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 251
LDI r2, 119
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (164, 54) with width 81 and height 120.
; PLAN: r0=164(x), r1=54(y), r2=81(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 54
LDI r2, 81
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
