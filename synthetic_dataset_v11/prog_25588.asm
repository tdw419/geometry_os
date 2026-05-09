; DESCRIPTION: Places a black line segment connecting (36, 86) to (97, 154).
; PLAN: r0=36(x1), r1=86(y1), r2=97(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 86
LDI r2, 97
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
