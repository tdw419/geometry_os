; DESCRIPTION: Places a yellow line segment connecting (426, 175) to (107, 81).
; PLAN: r0=426(x1), r1=175(y1), r2=107(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 175
LDI r2, 107
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
