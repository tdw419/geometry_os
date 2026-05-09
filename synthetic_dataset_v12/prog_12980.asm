; DESCRIPTION: Places a green line segment connecting (373, 10) to (336, 167).
; PLAN: r0=373(x1), r1=10(y1), r2=336(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 10
LDI r2, 336
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
