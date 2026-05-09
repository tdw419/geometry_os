; DESCRIPTION: Places a red line segment connecting (276, 177) to (60, 195).
; PLAN: r0=276(x1), r1=177(y1), r2=60(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 177
LDI r2, 60
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
