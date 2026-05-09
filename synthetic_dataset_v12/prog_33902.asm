; DESCRIPTION: Composite: Creates a magenta rectangular region at (6, 143) spanning 111 by 101 pixels then Renders a orange disk with center (436, 33) and radius 13.
; PLAN: r0=6(x), r1=143(y), r2=111(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=33(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 143
LDI r2, 111
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 33
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
