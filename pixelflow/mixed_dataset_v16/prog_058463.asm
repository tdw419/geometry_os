; DESCRIPTION: Places a yellow line segment connecting (182, 167) to (54, 237).
; PLAN: r0=182(x1), r1=167(y1), r2=54(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 167
LDI r2, 54
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
