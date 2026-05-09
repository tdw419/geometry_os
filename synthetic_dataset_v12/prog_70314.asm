; DESCRIPTION: Places a yellow line segment connecting (486, 98) to (4, 199).
; PLAN: r0=486(x1), r1=98(y1), r2=4(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 98
LDI r2, 4
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
