; DESCRIPTION: Renders a orange line between points (392, 219) and (306, 220).
; PLAN: r0=392(x1), r1=219(y1), r2=306(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 219
LDI r2, 306
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
