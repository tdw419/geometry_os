; DESCRIPTION: Draws a orange line from (124, 64) to (222, 51).
; PLAN: r0=124(x1), r1=64(y1), r2=222(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 64
LDI r2, 222
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
