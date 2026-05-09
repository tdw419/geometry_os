; DESCRIPTION: Places a red line segment connecting (482, 6) to (456, 74).
; PLAN: r0=482(x1), r1=6(y1), r2=456(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 6
LDI r2, 456
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
