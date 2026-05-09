; DESCRIPTION: Draws a yellow line from (317, 61) to (62, 195).
; PLAN: r0=317(x1), r1=61(y1), r2=62(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 61
LDI r2, 62
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
