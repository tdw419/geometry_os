; DESCRIPTION: Places a red line segment connecting (260, 20) to (290, 19).
; PLAN: r0=260(x1), r1=20(y1), r2=290(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 20
LDI r2, 290
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
