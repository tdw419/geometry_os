; DESCRIPTION: Places a blue line segment connecting (508, 45) to (16, 154).
; PLAN: r0=508(x1), r1=45(y1), r2=16(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 45
LDI r2, 16
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
