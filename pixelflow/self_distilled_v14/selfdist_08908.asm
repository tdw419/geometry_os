; DESCRIPTION: Renders a orange line segment connecting (83, 107) to (249, 154).
; PLAN: r0=83(x1), r1=107(y1), r2=249(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 107
LDI r2, 249
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
