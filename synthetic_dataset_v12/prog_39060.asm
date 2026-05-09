; DESCRIPTION: Draws a yellow line from (409, 29) to (104, 22).
; PLAN: r0=409(x1), r1=29(y1), r2=104(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 29
LDI r2, 104
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
