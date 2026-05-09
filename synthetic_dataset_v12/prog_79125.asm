; DESCRIPTION: Draws a yellow line from (333, 174) to (212, 100).
; PLAN: r0=333(x1), r1=174(y1), r2=212(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 174
LDI r2, 212
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
