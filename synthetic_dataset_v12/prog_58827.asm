; DESCRIPTION: Draws a blue line from (141, 79) to (274, 209).
; PLAN: r0=141(x1), r1=79(y1), r2=274(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 79
LDI r2, 274
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
