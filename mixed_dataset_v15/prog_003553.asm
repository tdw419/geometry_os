; DESCRIPTION: Draws a blue line from (163, 178) to (285, 236).
; PLAN: r0=163(x1), r1=178(y1), r2=285(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 178
LDI r2, 285
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
