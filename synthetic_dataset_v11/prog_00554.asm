; DESCRIPTION: Places a red line segment connecting (135, 253) to (45, 102).
; PLAN: r0=135(x1), r1=253(y1), r2=45(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 253
LDI r2, 45
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
