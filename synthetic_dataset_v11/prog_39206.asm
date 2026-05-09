; DESCRIPTION: Renders a red line between points (67, 122) and (5, 255).
; PLAN: r0=67(x1), r1=122(y1), r2=5(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 122
LDI r2, 5
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
