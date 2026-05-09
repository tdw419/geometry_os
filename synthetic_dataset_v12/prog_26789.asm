; DESCRIPTION: Draws a green line from (50, 43) to (159, 15).
; PLAN: r0=50(x1), r1=43(y1), r2=159(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 43
LDI r2, 159
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
