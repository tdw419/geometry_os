; DESCRIPTION: Places a red line segment connecting (460, 4) to (246, 101).
; PLAN: r0=460(x1), r1=4(y1), r2=246(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 4
LDI r2, 246
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
