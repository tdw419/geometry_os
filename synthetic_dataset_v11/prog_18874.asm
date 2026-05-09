; DESCRIPTION: Draws a blue line from (241, 175) to (91, 194).
; PLAN: r0=241(x1), r1=175(y1), r2=91(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 175
LDI r2, 91
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
