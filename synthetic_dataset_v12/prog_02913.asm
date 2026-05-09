; DESCRIPTION: Draws a yellow line from (28, 219) to (151, 136).
; PLAN: r0=28(x1), r1=219(y1), r2=151(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 219
LDI r2, 151
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
