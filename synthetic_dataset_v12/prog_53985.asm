; DESCRIPTION: Places a green line segment connecting (455, 22) to (203, 154).
; PLAN: r0=455(x1), r1=22(y1), r2=203(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 22
LDI r2, 203
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
