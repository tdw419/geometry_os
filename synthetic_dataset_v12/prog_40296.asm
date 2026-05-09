; DESCRIPTION: Places a red line segment connecting (163, 194) to (241, 164).
; PLAN: r0=163(x1), r1=194(y1), r2=241(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 194
LDI r2, 241
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
