; DESCRIPTION: Places a black line segment connecting (60, 241) to (144, 167).
; PLAN: r0=60(x1), r1=241(y1), r2=144(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 241
LDI r2, 144
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
