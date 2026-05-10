; DESCRIPTION: Renders a red line between points (320, 45) and (68, 53).
; PLAN: r0=320(x1), r1=45(y1), r2=68(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 45
LDI r2, 68
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
