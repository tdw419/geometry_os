; DESCRIPTION: Draws a blue line from (212, 130) to (56, 120).
; PLAN: r0=212(x1), r1=130(y1), r2=56(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 130
LDI r2, 56
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
