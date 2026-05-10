; DESCRIPTION: Draws a yellow line from (403, 151) to (310, 175).
; PLAN: r0=403(x1), r1=151(y1), r2=310(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 151
LDI r2, 310
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
