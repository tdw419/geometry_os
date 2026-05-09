; DESCRIPTION: Composite: Creates a magenta rectangular region at (230, 223) spanning 87 by 14 pixels then Places a magenta circle of radius 65 at center (317, 97).
; PLAN: r0=230(x), r1=223(y), r2=87(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=97(y), r7=65(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 230
LDI r1, 223
LDI r2, 87
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 97
LDI r7, 65
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
