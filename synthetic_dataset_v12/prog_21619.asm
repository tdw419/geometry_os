; DESCRIPTION: Draws a yellow line from (361, 62) to (491, 70).
; PLAN: r0=361(x1), r1=62(y1), r2=491(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 62
LDI r2, 491
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
