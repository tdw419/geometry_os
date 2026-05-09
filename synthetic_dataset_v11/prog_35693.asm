; DESCRIPTION: Draws a yellow line from (125, 244) to (86, 175).
; PLAN: r0=125(x1), r1=244(y1), r2=86(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 244
LDI r2, 86
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
