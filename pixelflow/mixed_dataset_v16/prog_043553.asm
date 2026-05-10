; DESCRIPTION: Places a black line segment connecting (2, 17) to (511, 154).
; PLAN: r0=2(x1), r1=17(y1), r2=511(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 17
LDI r2, 511
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
