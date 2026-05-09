; DESCRIPTION: Places a purple line segment connecting (22, 127) to (328, 253).
; PLAN: r0=22(x1), r1=127(y1), r2=328(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 127
LDI r2, 328
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
