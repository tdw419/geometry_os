; DESCRIPTION: Draws a red line from (34, 30) to (67, 255).
; PLAN: r0=34(x1), r1=30(y1), r2=67(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 30
LDI r2, 67
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
