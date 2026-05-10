; DESCRIPTION: Draws a yellow line from (262, 29) to (285, 157).
; PLAN: r0=262(x1), r1=29(y1), r2=285(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 29
LDI r2, 285
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
