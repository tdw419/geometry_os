; DESCRIPTION: Composite: Renders a blue line between points (135, 170) and (345, 193) then Places a yellow circle of radius 53 at center (354, 157).
; PLAN: r0=135(x1), r1=170(y1), r2=345(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=157(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 135
LDI r1, 170
LDI r2, 345
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 157
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
