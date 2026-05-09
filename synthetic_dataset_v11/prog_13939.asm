; DESCRIPTION: Draws a blue line from (213, 184) to (159, 139).
; PLAN: r0=213(x1), r1=184(y1), r2=159(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 184
LDI r2, 159
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
