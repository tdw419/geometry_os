; DESCRIPTION: Renders a orange line between points (29, 5) and (30, 220).
; PLAN: r0=29(x1), r1=5(y1), r2=30(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 5
LDI r2, 30
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
