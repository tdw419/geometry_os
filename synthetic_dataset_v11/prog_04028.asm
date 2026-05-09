; DESCRIPTION: Places a blue line segment connecting (206, 139) to (211, 192).
; PLAN: r0=206(x1), r1=139(y1), r2=211(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 139
LDI r2, 211
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
