; DESCRIPTION: Draws a blue line from (504, 203) to (161, 123).
; PLAN: r0=504(x1), r1=203(y1), r2=161(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 203
LDI r2, 161
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
