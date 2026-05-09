; DESCRIPTION: Renders a yellow line between points (244, 75) and (116, 50).
; PLAN: r0=244(x1), r1=75(y1), r2=116(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 75
LDI r2, 116
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
