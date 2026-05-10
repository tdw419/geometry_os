; DESCRIPTION: Draws a yellow line from (130, 70) to (266, 182).
; PLAN: r0=130(x1), r1=70(y1), r2=266(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 70
LDI r2, 266
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
