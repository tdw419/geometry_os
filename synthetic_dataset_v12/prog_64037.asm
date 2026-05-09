; DESCRIPTION: Renders a blue line between points (123, 203) and (492, 55).
; PLAN: r0=123(x1), r1=203(y1), r2=492(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 203
LDI r2, 492
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
