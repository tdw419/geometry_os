; DESCRIPTION: Draws a green line from (53, 160) to (40, 98).
; PLAN: r0=53(x1), r1=160(y1), r2=40(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 160
LDI r2, 40
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
