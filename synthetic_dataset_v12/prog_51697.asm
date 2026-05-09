; DESCRIPTION: Places a red line segment connecting (228, 51) to (143, 97).
; PLAN: r0=228(x1), r1=51(y1), r2=143(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 51
LDI r2, 143
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
