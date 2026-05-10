; DESCRIPTION: Draws a green line from (159, 96) to (90, 148).
; PLAN: r0=159(x1), r1=96(y1), r2=90(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 96
LDI r2, 90
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
