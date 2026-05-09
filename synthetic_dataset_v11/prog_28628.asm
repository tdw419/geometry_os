; DESCRIPTION: Draws a yellow line from (50, 115) to (211, 204).
; PLAN: r0=50(x1), r1=115(y1), r2=211(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 115
LDI r2, 211
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
