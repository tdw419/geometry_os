; DESCRIPTION: Draws a yellow line from (153, 195) to (134, 65).
; PLAN: r0=153(x1), r1=195(y1), r2=134(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 195
LDI r2, 134
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
