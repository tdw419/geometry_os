; DESCRIPTION: Places a yellow line segment connecting (167, 199) to (34, 236).
; PLAN: r0=167(x1), r1=199(y1), r2=34(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 199
LDI r2, 34
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
