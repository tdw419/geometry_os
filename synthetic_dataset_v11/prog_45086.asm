; DESCRIPTION: Draws a blue line from (159, 226) to (252, 111).
; PLAN: r0=159(x1), r1=226(y1), r2=252(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 226
LDI r2, 252
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
