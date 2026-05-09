; DESCRIPTION: Draws a yellow line from (81, 21) to (80, 39).
; PLAN: r0=81(x1), r1=21(y1), r2=80(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 21
LDI r2, 80
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
