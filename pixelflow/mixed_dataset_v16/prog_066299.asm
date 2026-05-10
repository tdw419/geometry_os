; DESCRIPTION: Draws a red line from (170, 65) to (62, 197).
; PLAN: r0=170(x1), r1=65(y1), r2=62(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 65
LDI r2, 62
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
