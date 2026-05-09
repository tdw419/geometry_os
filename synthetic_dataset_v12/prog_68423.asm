; DESCRIPTION: Draws a blue line from (191, 130) to (236, 194).
; PLAN: r0=191(x1), r1=130(y1), r2=236(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 130
LDI r2, 236
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
