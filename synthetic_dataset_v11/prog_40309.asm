; DESCRIPTION: Places a red line segment connecting (31, 228) to (44, 132).
; PLAN: r0=31(x1), r1=228(y1), r2=44(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 228
LDI r2, 44
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
