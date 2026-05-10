; DESCRIPTION: Composite: Renders a purple disk with center (388, 134) and radius 49 then Renders a magenta box of size 26x31 starting at (384, 145).
; PLAN: r0=388(x), r1=134(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=145(y), r7=26(width), r8=31(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 134
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 145
LDI r7, 26
LDI r8, 31
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
