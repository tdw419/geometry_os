; DESCRIPTION: Places a black line segment connecting (113, 68) to (148, 74).
; PLAN: r0=113(x1), r1=68(y1), r2=148(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 68
LDI r2, 148
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
