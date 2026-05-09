; DESCRIPTION: Places a yellow line segment connecting (320, 3) to (140, 167).
; PLAN: r0=320(x1), r1=3(y1), r2=140(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 3
LDI r2, 140
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
