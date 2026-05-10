; DESCRIPTION: Draws a blue line from (191, 12) to (177, 20).
; PLAN: r0=191(x1), r1=12(y1), r2=177(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 12
LDI r2, 177
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
