; DESCRIPTION: Renders a white line segment connecting (116, 82) to (4, 176).
; PLAN: r0=116(x1), r1=82(y1), r2=4(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 82
LDI r2, 4
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
