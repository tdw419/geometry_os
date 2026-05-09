; DESCRIPTION: Draws a yellow line from (328, 204) to (95, 250).
; PLAN: r0=328(x1), r1=204(y1), r2=95(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 204
LDI r2, 95
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
