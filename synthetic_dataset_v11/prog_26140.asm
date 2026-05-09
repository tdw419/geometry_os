; DESCRIPTION: Places a blue line segment connecting (123, 12) to (162, 154).
; PLAN: r0=123(x1), r1=12(y1), r2=162(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 12
LDI r2, 162
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
