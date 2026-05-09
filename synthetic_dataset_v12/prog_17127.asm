; DESCRIPTION: Draws a yellow line from (286, 136) to (221, 236).
; PLAN: r0=286(x1), r1=136(y1), r2=221(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 136
LDI r2, 221
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
