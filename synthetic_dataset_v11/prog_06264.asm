; DESCRIPTION: Draws a blue line from (70, 125) to (239, 137).
; PLAN: r0=70(x1), r1=125(y1), r2=239(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 125
LDI r2, 239
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
