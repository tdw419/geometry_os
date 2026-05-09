; DESCRIPTION: Renders a orange line between points (196, 223) and (57, 145).
; PLAN: r0=196(x1), r1=223(y1), r2=57(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 223
LDI r2, 57
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
