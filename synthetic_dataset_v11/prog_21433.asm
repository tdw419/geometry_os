; DESCRIPTION: Places a yellow line segment connecting (24, 55) to (225, 167).
; PLAN: r0=24(x1), r1=55(y1), r2=225(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 55
LDI r2, 225
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
