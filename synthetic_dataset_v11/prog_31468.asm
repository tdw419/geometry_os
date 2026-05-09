; DESCRIPTION: Places a yellow line segment connecting (59, 105) to (116, 107).
; PLAN: r0=59(x1), r1=105(y1), r2=116(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 105
LDI r2, 116
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
