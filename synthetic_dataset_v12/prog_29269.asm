; DESCRIPTION: Places a red line segment connecting (236, 114) to (272, 204).
; PLAN: r0=236(x1), r1=114(y1), r2=272(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 114
LDI r2, 272
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
