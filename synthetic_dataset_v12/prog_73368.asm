; DESCRIPTION: Places a red line segment connecting (103, 22) to (9, 138).
; PLAN: r0=103(x1), r1=22(y1), r2=9(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 22
LDI r2, 9
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
