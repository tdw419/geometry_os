; DESCRIPTION: Places a red line segment connecting (2, 12) to (202, 176).
; PLAN: r0=2(x1), r1=12(y1), r2=202(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 12
LDI r2, 202
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
