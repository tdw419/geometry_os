; DESCRIPTION: Renders a orange line between points (229, 210) and (448, 164).
; PLAN: r0=229(x1), r1=210(y1), r2=448(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 210
LDI r2, 448
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
