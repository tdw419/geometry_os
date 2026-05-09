; DESCRIPTION: Draws a green line from (111, 62) to (159, 101).
; PLAN: r0=111(x1), r1=62(y1), r2=159(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 62
LDI r2, 159
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
