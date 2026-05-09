; DESCRIPTION: Draws a blue line from (19, 106) to (506, 253).
; PLAN: r0=19(x1), r1=106(y1), r2=506(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 106
LDI r2, 506
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
