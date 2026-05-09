; DESCRIPTION: Composite: Creates a magenta rectangular region at (36, 89) spanning 118 by 94 pixels then Draws a magenta circle centered at (404, 71) with radius 64.
; PLAN: r0=36(x), r1=89(y), r2=118(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=71(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 36
LDI r1, 89
LDI r2, 118
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 71
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
