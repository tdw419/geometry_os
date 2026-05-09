; DESCRIPTION: Places a yellow line segment connecting (506, 143) to (60, 167).
; PLAN: r0=506(x1), r1=143(y1), r2=60(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 143
LDI r2, 60
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
