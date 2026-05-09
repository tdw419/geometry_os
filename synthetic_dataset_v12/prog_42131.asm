; DESCRIPTION: Places a purple line segment connecting (17, 213) to (444, 38).
; PLAN: r0=17(x1), r1=213(y1), r2=444(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 213
LDI r2, 444
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
