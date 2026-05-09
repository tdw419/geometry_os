; DESCRIPTION: Places a yellow line segment connecting (426, 22) to (182, 17).
; PLAN: r0=426(x1), r1=22(y1), r2=182(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 22
LDI r2, 182
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
