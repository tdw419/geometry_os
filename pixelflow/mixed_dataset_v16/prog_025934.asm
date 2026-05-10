; DESCRIPTION: Draws a purple line from (35, 106) to (239, 149).
; PLAN: r0=35(x1), r1=106(y1), r2=239(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 106
LDI r2, 239
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
