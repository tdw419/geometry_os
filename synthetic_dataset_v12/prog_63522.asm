; DESCRIPTION: Draws a blue line from (239, 134) to (240, 217).
; PLAN: r0=239(x1), r1=134(y1), r2=240(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 134
LDI r2, 240
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
