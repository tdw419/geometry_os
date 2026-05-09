; DESCRIPTION: Places a red line segment connecting (444, 158) to (228, 213).
; PLAN: r0=444(x1), r1=158(y1), r2=228(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 158
LDI r2, 228
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
