; DESCRIPTION: Renders a green line between points (472, 97) and (417, 108).
; PLAN: r0=472(x1), r1=97(y1), r2=417(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 97
LDI r2, 417
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
