; DESCRIPTION: Places a yellow line segment connecting (439, 23) to (86, 154).
; PLAN: r0=439(x1), r1=23(y1), r2=86(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 23
LDI r2, 86
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
