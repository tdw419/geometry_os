; DESCRIPTION: Draws a purple line from (239, 175) to (21, 140).
; PLAN: r0=239(x1), r1=175(y1), r2=21(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 175
LDI r2, 21
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
