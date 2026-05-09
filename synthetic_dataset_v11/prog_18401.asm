; DESCRIPTION: Places a red line segment connecting (166, 99) to (66, 246).
; PLAN: r0=166(x1), r1=99(y1), r2=66(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 99
LDI r2, 66
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
