; DESCRIPTION: Places a red line segment connecting (290, 174) to (8, 76).
; PLAN: r0=290(x1), r1=174(y1), r2=8(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 174
LDI r2, 8
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
