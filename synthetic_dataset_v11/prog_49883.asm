; DESCRIPTION: Draws a yellow line from (188, 157) to (233, 125).
; PLAN: r0=188(x1), r1=157(y1), r2=233(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 157
LDI r2, 233
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
