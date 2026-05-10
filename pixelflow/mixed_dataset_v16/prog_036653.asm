; DESCRIPTION: Draws a blue line from (436, 25) to (209, 236).
; PLAN: r0=436(x1), r1=25(y1), r2=209(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 25
LDI r2, 209
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
