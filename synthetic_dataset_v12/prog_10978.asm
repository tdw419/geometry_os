; DESCRIPTION: Composite: Renders a blue disk with center (326, 183) and radius 45 then Renders a magenta box of size 10x34 starting at (79, 163).
; PLAN: r0=326(x), r1=183(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=163(y), r7=10(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 183
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 163
LDI r7, 10
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
