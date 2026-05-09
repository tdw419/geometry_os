; DESCRIPTION: Draws a yellow line from (30, 140) to (286, 220).
; PLAN: r0=30(x1), r1=140(y1), r2=286(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 140
LDI r2, 286
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
