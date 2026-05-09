; DESCRIPTION: Draws a yellow line from (360, 155) to (292, 98).
; PLAN: r0=360(x1), r1=155(y1), r2=292(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 155
LDI r2, 292
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
