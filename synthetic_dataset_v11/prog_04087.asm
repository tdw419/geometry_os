; DESCRIPTION: Draws a blue line from (199, 71) to (191, 255).
; PLAN: r0=199(x1), r1=71(y1), r2=191(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 71
LDI r2, 191
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
