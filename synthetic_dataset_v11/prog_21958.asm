; DESCRIPTION: Places a yellow line segment connecting (47, 248) to (228, 119).
; PLAN: r0=47(x1), r1=248(y1), r2=228(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 248
LDI r2, 228
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
