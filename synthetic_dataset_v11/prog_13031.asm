; DESCRIPTION: Draws a yellow line from (241, 146) to (62, 119).
; PLAN: r0=241(x1), r1=146(y1), r2=62(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 146
LDI r2, 62
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
