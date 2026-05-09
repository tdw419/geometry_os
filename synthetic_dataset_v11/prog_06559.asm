; DESCRIPTION: Renders a yellow line between points (69, 160) and (109, 62).
; PLAN: r0=69(x1), r1=160(y1), r2=109(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 160
LDI r2, 109
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
