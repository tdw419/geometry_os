; DESCRIPTION: Draws a white line from (506, 36) to (132, 100).
; PLAN: r0=506(x1), r1=36(y1), r2=132(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 36
LDI r2, 132
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
