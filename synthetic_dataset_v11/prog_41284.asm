; DESCRIPTION: Draws a blue line from (255, 220) to (195, 69).
; PLAN: r0=255(x1), r1=220(y1), r2=195(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 220
LDI r2, 195
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
