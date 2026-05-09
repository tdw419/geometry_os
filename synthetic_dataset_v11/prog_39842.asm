; DESCRIPTION: Draws a green line from (159, 218) to (246, 173).
; PLAN: r0=159(x1), r1=218(y1), r2=246(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 218
LDI r2, 246
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
