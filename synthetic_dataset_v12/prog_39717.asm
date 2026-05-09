; DESCRIPTION: Places a orange line segment connecting (217, 92) to (90, 154).
; PLAN: r0=217(x1), r1=92(y1), r2=90(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 92
LDI r2, 90
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
