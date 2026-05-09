; DESCRIPTION: Places a magenta line segment connecting (504, 30) to (108, 198).
; PLAN: r0=504(x1), r1=30(y1), r2=108(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 30
LDI r2, 108
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
