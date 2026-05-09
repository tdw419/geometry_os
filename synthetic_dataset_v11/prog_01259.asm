; DESCRIPTION: Places a red line segment connecting (99, 213) to (158, 204).
; PLAN: r0=99(x1), r1=213(y1), r2=158(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 213
LDI r2, 158
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
