; DESCRIPTION: Places a orange line segment connecting (392, 232) to (148, 154).
; PLAN: r0=392(x1), r1=232(y1), r2=148(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 232
LDI r2, 148
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
