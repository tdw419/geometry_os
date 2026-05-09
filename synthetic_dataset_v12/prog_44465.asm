; DESCRIPTION: Places a green line segment connecting (259, 148) to (433, 154).
; PLAN: r0=259(x1), r1=148(y1), r2=433(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 148
LDI r2, 433
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
