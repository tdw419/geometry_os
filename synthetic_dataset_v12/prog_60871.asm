; DESCRIPTION: Renders a green line between points (283, 212) and (183, 230).
; PLAN: r0=283(x1), r1=212(y1), r2=183(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 212
LDI r2, 183
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
