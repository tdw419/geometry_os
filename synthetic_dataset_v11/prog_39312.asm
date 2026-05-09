; DESCRIPTION: Places a white line segment connecting (93, 64) to (91, 186).
; PLAN: r0=93(x1), r1=64(y1), r2=91(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 64
LDI r2, 91
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
