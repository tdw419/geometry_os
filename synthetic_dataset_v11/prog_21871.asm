; DESCRIPTION: Draws a yellow line from (198, 93) to (111, 163).
; PLAN: r0=198(x1), r1=93(y1), r2=111(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 93
LDI r2, 111
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
