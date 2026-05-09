; DESCRIPTION: Places a purple line segment connecting (21, 229) to (172, 253).
; PLAN: r0=21(x1), r1=229(y1), r2=172(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 229
LDI r2, 172
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
