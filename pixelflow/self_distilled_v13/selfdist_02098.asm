; DESCRIPTION: Draws a purple line from (151, 57) to (101, 125).
; PLAN: r0=151(x1), r1=57(y1), r2=101(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 57
LDI r2, 101
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
