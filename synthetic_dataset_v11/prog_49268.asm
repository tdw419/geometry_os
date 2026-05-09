; DESCRIPTION: Draws a yellow line from (95, 129) to (95, 35).
; PLAN: r0=95(x1), r1=129(y1), r2=95(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 129
LDI r2, 95
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
