; DESCRIPTION: Places a red line segment connecting (470, 182) to (495, 130).
; PLAN: r0=470(x1), r1=182(y1), r2=495(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 182
LDI r2, 495
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
