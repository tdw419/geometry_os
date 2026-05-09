; DESCRIPTION: Renders a orange line between points (254, 220) and (66, 233).
; PLAN: r0=254(x1), r1=220(y1), r2=66(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 220
LDI r2, 66
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
