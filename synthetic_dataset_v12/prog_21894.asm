; DESCRIPTION: Places a magenta line segment connecting (303, 55) to (161, 36).
; PLAN: r0=303(x1), r1=55(y1), r2=161(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 55
LDI r2, 161
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
