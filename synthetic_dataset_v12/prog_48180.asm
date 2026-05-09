; DESCRIPTION: Places a red line segment connecting (399, 253) to (415, 118).
; PLAN: r0=399(x1), r1=253(y1), r2=415(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 253
LDI r2, 415
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
