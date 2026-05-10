; DESCRIPTION: Renders a red line segment connecting (217, 102) to (184, 42).
; PLAN: r0=217(x1), r1=102(y1), r2=184(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 102
LDI r2, 184
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
