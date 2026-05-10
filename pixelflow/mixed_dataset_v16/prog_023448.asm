; DESCRIPTION: Draws a yellow line from (452, 98) to (273, 129).
; PLAN: r0=452(x1), r1=98(y1), r2=273(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 98
LDI r2, 273
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
