; DESCRIPTION: Composite: Renders a purple line between points (464, 133) and (322, 161) then Creates a yellow circular shape at (243, 68) with radius 56.
; PLAN: r0=464(x1), r1=133(y1), r2=322(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=68(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 464
LDI r1, 133
LDI r2, 322
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 68
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
