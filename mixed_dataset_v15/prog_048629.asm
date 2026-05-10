; DESCRIPTION: Composite: Renders a white disk with center (265, 140) and radius 50 then Creates a magenta rectangular region at (302, 131) spanning 66 by 19 pixels.
; PLAN: r0=265(x), r1=140(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=131(y), r7=66(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 140
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 131
LDI r7, 66
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
