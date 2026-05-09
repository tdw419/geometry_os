; DESCRIPTION: Draws a red line from (67, 70) to (2, 64).
; PLAN: r0=67(x1), r1=70(y1), r2=2(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 70
LDI r2, 2
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
