; DESCRIPTION: Places a red line segment connecting (426, 128) to (313, 155).
; PLAN: r0=426(x1), r1=128(y1), r2=313(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 128
LDI r2, 313
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
