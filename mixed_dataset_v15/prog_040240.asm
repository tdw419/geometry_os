; DESCRIPTION: Composite: Renders a blue line between points (337, 1) and (84, 26) then Places a magenta circle of radius 55 at center (253, 164).
; PLAN: r0=337(x1), r1=1(y1), r2=84(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=164(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 337
LDI r1, 1
LDI r2, 84
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 164
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
