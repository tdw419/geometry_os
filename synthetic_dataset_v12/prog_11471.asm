; DESCRIPTION: Draws a green line from (281, 49) to (223, 163).
; PLAN: r0=281(x1), r1=49(y1), r2=223(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 49
LDI r2, 223
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
