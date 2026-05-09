; DESCRIPTION: Draws a blue line from (177, 83) to (189, 29).
; PLAN: r0=177(x1), r1=83(y1), r2=189(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 83
LDI r2, 189
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
