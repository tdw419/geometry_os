; DESCRIPTION: Composite: Renders a red box of size 94x96 starting at (111, 148) then Draws a green circle centered at (199, 65) with radius 47.
; PLAN: r0=111(x), r1=148(y), r2=94(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=65(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 148
LDI r2, 94
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 65
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
