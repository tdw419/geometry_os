; DESCRIPTION: Places a red line segment connecting (68, 200) to (194, 228).
; PLAN: r0=68(x1), r1=200(y1), r2=194(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 200
LDI r2, 194
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
