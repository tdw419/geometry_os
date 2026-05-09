; DESCRIPTION: Places a red line segment connecting (47, 159) to (103, 25).
; PLAN: r0=47(x1), r1=159(y1), r2=103(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 159
LDI r2, 103
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
