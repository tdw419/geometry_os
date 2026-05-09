; DESCRIPTION: Composite: Renders a blue disk with center (458, 198) and radius 51 then Creates a magenta rectangular region at (257, 222) spanning 68 by 29 pixels.
; PLAN: r0=458(x), r1=198(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=222(y), r7=68(width), r8=29(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 198
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 222
LDI r7, 68
LDI r8, 29
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
