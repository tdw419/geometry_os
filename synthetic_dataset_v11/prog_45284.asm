; DESCRIPTION: Places a red line segment connecting (246, 17) to (9, 42).
; PLAN: r0=246(x1), r1=17(y1), r2=9(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 17
LDI r2, 9
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
