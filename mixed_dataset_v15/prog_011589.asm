; DESCRIPTION: Composite: Renders a red line between points (209, 34) and (354, 116) then Places a magenta circle of radius 13 at center (256, 129).
; PLAN: r0=209(x1), r1=34(y1), r2=354(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=129(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 34
LDI r2, 354
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 129
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
