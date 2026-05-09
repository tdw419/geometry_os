; DESCRIPTION: Draws a yellow line from (129, 177) to (371, 104).
; PLAN: r0=129(x1), r1=177(y1), r2=371(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 177
LDI r2, 371
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
