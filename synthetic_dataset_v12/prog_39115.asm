; DESCRIPTION: Places a yellow line segment connecting (358, 81) to (59, 108).
; PLAN: r0=358(x1), r1=81(y1), r2=59(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 81
LDI r2, 59
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
