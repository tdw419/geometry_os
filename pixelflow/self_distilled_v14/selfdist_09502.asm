; DESCRIPTION: Draws a blue line from (87, 138) to (119, 192).
; PLAN: r0=87(x1), r1=138(y1), r2=119(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 138
LDI r2, 119
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
