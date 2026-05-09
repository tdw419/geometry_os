; DESCRIPTION: Composite: Renders a white box of size 67x53 starting at (396, 36) then Renders a magenta disk with center (206, 182) and radius 56.
; PLAN: r0=396(x), r1=36(y), r2=67(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=182(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 36
LDI r2, 67
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 182
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
