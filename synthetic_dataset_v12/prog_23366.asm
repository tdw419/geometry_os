; DESCRIPTION: Renders a yellow line between points (223, 83) and (279, 69).
; PLAN: r0=223(x1), r1=83(y1), r2=279(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 83
LDI r2, 279
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
