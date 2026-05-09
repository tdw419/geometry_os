; DESCRIPTION: Composite: Draws a magenta circle centered at (159, 150) with radius 73 then Creates a magenta rectangular region at (352, 161) spanning 96 by 83 pixels.
; PLAN: r0=159(x), r1=150(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=161(y), r7=96(width), r8=83(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 150
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 161
LDI r7, 96
LDI r8, 83
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
