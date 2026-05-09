; DESCRIPTION: Composite: . Then Creates a blue circular shape at (149, 182) with radius 65. Then Creates a magenta rectangular region at (145, 148) spanning 64 by 52 pixels.
; PLAN: r0=149(x), r1=182(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=145(x), r1=148(y), r2=64(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (149, 182) with radius 65.
; PLAN: r0=149(x), r1=182(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 182
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (145, 148) spanning 64 by 52 pixels.
; PLAN: r0=145(x), r1=148(y), r2=64(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 148
LDI r2, 64
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
