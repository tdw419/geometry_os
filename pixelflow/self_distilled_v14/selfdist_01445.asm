; DESCRIPTION: Renders a red line segment connecting (12, 32) to (299, 26).
; PLAN: r0=12(x1), r1=32(y1), r2=299(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 32
LDI r2, 299
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
