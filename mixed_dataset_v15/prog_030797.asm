; DESCRIPTION: Places a black line segment connecting (93, 15) to (352, 154).
; PLAN: r0=93(x1), r1=15(y1), r2=352(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 15
LDI r2, 352
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
