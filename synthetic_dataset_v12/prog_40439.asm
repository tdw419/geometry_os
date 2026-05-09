; DESCRIPTION: Renders a blue line between points (206, 102) and (324, 192).
; PLAN: r0=206(x1), r1=102(y1), r2=324(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 102
LDI r2, 324
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
