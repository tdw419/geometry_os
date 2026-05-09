; DESCRIPTION: Renders a green line between points (471, 222) and (116, 206).
; PLAN: r0=471(x1), r1=222(y1), r2=116(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 222
LDI r2, 116
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
