; DESCRIPTION: Places a orange line segment connecting (160, 197) to (226, 83).
; PLAN: r0=160(x1), r1=197(y1), r2=226(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 197
LDI r2, 226
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
