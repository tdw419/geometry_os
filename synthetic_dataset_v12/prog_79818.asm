; DESCRIPTION: Draws a yellow line from (227, 65) to (409, 59).
; PLAN: r0=227(x1), r1=65(y1), r2=409(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 65
LDI r2, 409
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
