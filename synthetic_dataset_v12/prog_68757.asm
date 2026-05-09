; DESCRIPTION: Places a red line segment connecting (262, 227) to (42, 90).
; PLAN: r0=262(x1), r1=227(y1), r2=42(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 227
LDI r2, 42
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
