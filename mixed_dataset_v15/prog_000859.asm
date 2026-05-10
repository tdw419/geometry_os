; DESCRIPTION: Places a red line segment connecting (324, 54) to (384, 186).
; PLAN: r0=324(x1), r1=54(y1), r2=384(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 54
LDI r2, 384
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
