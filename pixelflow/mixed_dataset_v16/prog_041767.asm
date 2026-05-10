; DESCRIPTION: Draws a green line from (155, 138) to (221, 195).
; PLAN: r0=155(x1), r1=138(y1), r2=221(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 138
LDI r2, 221
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
