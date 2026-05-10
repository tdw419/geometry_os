; DESCRIPTION: Places a purple line segment connecting (262, 4) to (412, 83).
; PLAN: r0=262(x1), r1=4(y1), r2=412(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 4
LDI r2, 412
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
