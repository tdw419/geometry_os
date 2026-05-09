; DESCRIPTION: Composite: Places a purple circle of radius 10 at center (131, 59) then Renders a yellow line between points (283, 140) and (64, 49).
; PLAN: r0=131(x), r1=59(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x1), r6=140(y1), r7=64(x2), r8=49(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 59
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 140
LDI r7, 64
LDI r8, 49
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
