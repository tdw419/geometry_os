; DESCRIPTION: Draws a green line from (220, 232) to (98, 34).
; PLAN: r0=220(x1), r1=232(y1), r2=98(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 232
LDI r2, 98
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
