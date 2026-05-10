; DESCRIPTION: Draws a yellow line from (51, 54) to (264, 140).
; PLAN: r0=51(x1), r1=54(y1), r2=264(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 54
LDI r2, 264
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
