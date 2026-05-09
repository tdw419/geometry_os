; DESCRIPTION: Places a magenta line segment connecting (385, 148) to (303, 149).
; PLAN: r0=385(x1), r1=148(y1), r2=303(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 148
LDI r2, 303
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
