; DESCRIPTION: Renders a orange line between points (78, 165) and (8, 215).
; PLAN: r0=78(x1), r1=165(y1), r2=8(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 165
LDI r2, 8
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
