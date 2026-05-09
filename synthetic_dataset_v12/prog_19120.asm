; DESCRIPTION: Places a purple line segment connecting (375, 133) to (291, 146).
; PLAN: r0=375(x1), r1=133(y1), r2=291(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 133
LDI r2, 291
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
