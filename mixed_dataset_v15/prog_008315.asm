; DESCRIPTION: Composite: Renders a green line between points (114, 16) and (274, 131) then Places a yellow circle of radius 46 at center (455, 80).
; PLAN: r0=114(x1), r1=16(y1), r2=274(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=80(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 16
LDI r2, 274
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 80
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
