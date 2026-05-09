; DESCRIPTION: Composite: Creates a magenta rectangular region at (359, 81) spanning 85 by 63 pixels then Places a magenta circle of radius 66 at center (215, 116).
; PLAN: r0=359(x), r1=81(y), r2=85(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x), r6=116(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 81
LDI r2, 85
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 116
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
