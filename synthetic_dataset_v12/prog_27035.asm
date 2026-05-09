; DESCRIPTION: Draws a blue line from (478, 127) to (239, 105).
; PLAN: r0=478(x1), r1=127(y1), r2=239(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 127
LDI r2, 239
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
