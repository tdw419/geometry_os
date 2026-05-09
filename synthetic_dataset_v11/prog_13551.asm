; DESCRIPTION: Places a red line segment connecting (171, 159) to (115, 135).
; PLAN: r0=171(x1), r1=159(y1), r2=115(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 159
LDI r2, 115
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
