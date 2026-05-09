; DESCRIPTION: Places a purple line segment connecting (506, 213) to (185, 33).
; PLAN: r0=506(x1), r1=213(y1), r2=185(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 213
LDI r2, 185
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
