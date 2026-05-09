; DESCRIPTION: Renders a blue line between points (203, 79) and (0, 222).
; PLAN: r0=203(x1), r1=79(y1), r2=0(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 79
LDI r2, 0
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
