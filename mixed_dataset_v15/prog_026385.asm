; DESCRIPTION: Places a red line segment connecting (218, 26) to (98, 199).
; PLAN: r0=218(x1), r1=26(y1), r2=98(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 26
LDI r2, 98
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
