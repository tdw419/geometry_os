; DESCRIPTION: Draws a green line from (153, 99) to (136, 71).
; PLAN: r0=153(x1), r1=99(y1), r2=136(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 99
LDI r2, 136
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
