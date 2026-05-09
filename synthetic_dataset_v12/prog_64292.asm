; DESCRIPTION: Composite: Draws a purple circle centered at (111, 48) with radius 19 then Creates a magenta rectangular region at (377, 131) spanning 98 by 35 pixels.
; PLAN: r0=111(x), r1=48(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=131(y), r7=98(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 48
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 131
LDI r7, 98
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
