; DESCRIPTION: Renders a orange line between points (324, 78) and (220, 103).
; PLAN: r0=324(x1), r1=78(y1), r2=220(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 78
LDI r2, 220
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
