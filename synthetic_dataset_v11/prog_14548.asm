; DESCRIPTION: Renders a blue line between points (108, 216) and (203, 236).
; PLAN: r0=108(x1), r1=216(y1), r2=203(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 216
LDI r2, 203
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
