; DESCRIPTION: Composite: Places a yellow circle of radius 67 at center (189, 73) then Renders a blue line between points (131, 49) and (218, 145).
; PLAN: r0=189(x), r1=73(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x1), r6=49(y1), r7=218(x2), r8=145(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 73
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 49
LDI r7, 218
LDI r8, 145
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
