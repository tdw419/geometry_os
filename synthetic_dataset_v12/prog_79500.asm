; DESCRIPTION: Places a red line segment connecting (169, 75) to (123, 42).
; PLAN: r0=169(x1), r1=75(y1), r2=123(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 75
LDI r2, 123
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
