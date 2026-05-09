; DESCRIPTION: Draws a green line from (76, 99) to (12, 148).
; PLAN: r0=76(x1), r1=99(y1), r2=12(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 99
LDI r2, 12
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
