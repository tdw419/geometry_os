; DESCRIPTION: Places a red line segment connecting (125, 246) to (57, 172).
; PLAN: r0=125(x1), r1=246(y1), r2=57(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 246
LDI r2, 57
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
