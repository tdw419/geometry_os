; DESCRIPTION: Composite: Renders a blue line between points (412, 222) and (78, 61) then Places a magenta circle of radius 44 at center (45, 190).
; PLAN: r0=412(x1), r1=222(y1), r2=78(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=190(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 412
LDI r1, 222
LDI r2, 78
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 190
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
