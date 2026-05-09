; DESCRIPTION: Draws a yellow line from (151, 59) to (115, 74).
; PLAN: r0=151(x1), r1=59(y1), r2=115(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 59
LDI r2, 115
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
