; DESCRIPTION: Composite: . Then Renders a orange line between points (245, 110) and (153, 19). Then Renders a blue box of size 80x52 starting at (126, 106).
; PLAN: r0=245(x1), r1=110(y1), r2=153(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=126(x), r1=106(y), r2=80(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange line between points (245, 110) and (153, 19).
; PLAN: r0=245(x1), r1=110(y1), r2=153(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 110
LDI r2, 153
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 80x52 starting at (126, 106).
; PLAN: r0=126(x), r1=106(y), r2=80(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 106
LDI r2, 80
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
