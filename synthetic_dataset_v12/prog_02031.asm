; DESCRIPTION: Draws a red line from (323, 191) to (253, 151).
; PLAN: r0=323(x1), r1=191(y1), r2=253(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 191
LDI r2, 253
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
