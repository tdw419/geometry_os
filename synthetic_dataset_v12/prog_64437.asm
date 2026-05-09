; DESCRIPTION: Composite: Places a magenta circle of radius 65 at center (198, 102) then Renders a blue line between points (257, 14) and (426, 217).
; PLAN: r0=198(x), r1=102(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x1), r6=14(y1), r7=426(x2), r8=217(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 102
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 14
LDI r7, 426
LDI r8, 217
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
