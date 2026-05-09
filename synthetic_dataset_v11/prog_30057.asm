; DESCRIPTION: Draws a green line from (161, 172) to (37, 101).
; PLAN: r0=161(x1), r1=172(y1), r2=37(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 172
LDI r2, 37
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
