; DESCRIPTION: Places a black line segment connecting (188, 67) to (493, 198).
; PLAN: r0=188(x1), r1=67(y1), r2=493(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 67
LDI r2, 493
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
