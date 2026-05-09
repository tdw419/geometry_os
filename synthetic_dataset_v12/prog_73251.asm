; DESCRIPTION: Draws a yellow line from (372, 86) to (412, 124).
; PLAN: r0=372(x1), r1=86(y1), r2=412(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 86
LDI r2, 412
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
