; DESCRIPTION: Places a yellow line segment connecting (0, 51) to (180, 245).
; PLAN: r0=0(x1), r1=51(y1), r2=180(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 51
LDI r2, 180
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
