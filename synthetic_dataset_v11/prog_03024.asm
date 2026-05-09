; DESCRIPTION: Places a red line segment connecting (67, 85) to (75, 240).
; PLAN: r0=67(x1), r1=85(y1), r2=75(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 85
LDI r2, 75
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
