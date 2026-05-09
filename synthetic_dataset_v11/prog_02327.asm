; DESCRIPTION: Draws a green line from (192, 93) to (69, 129).
; PLAN: r0=192(x1), r1=93(y1), r2=69(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 93
LDI r2, 69
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
