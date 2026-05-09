; DESCRIPTION: Composite: Renders a black disk with center (165, 155) and radius 68 then Renders a magenta box of size 10x71 starting at (134, 134).
; PLAN: r0=165(x), r1=155(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=134(y), r7=10(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 155
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 134
LDI r7, 10
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
