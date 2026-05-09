; DESCRIPTION: Composite: Draws a black circle centered at (107, 180) with radius 64 then Creates a magenta rectangular region at (61, 38) spanning 18 by 103 pixels.
; PLAN: r0=107(x), r1=180(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=38(y), r7=18(width), r8=103(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 180
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 38
LDI r7, 18
LDI r8, 103
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
