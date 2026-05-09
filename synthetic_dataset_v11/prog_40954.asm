; DESCRIPTION: Draws a purple line from (1, 0) to (202, 253).
; PLAN: r0=1(x1), r1=0(y1), r2=202(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 0
LDI r2, 202
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
