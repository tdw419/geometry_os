; DESCRIPTION: Places a purple line segment connecting (81, 244) to (436, 192).
; PLAN: r0=81(x1), r1=244(y1), r2=436(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 244
LDI r2, 436
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
