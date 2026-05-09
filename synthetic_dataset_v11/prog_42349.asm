; DESCRIPTION: Places a red line segment connecting (142, 165) to (167, 18).
; PLAN: r0=142(x1), r1=165(y1), r2=167(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 165
LDI r2, 167
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
