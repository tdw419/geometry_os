; DESCRIPTION: Draws a yellow line from (244, 46) to (141, 204).
; PLAN: r0=244(x1), r1=46(y1), r2=141(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 46
LDI r2, 141
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
