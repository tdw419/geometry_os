; DESCRIPTION: Composite: Creates a magenta circular shape at (369, 139) with radius 24 then Renders a black box of size 113x62 starting at (380, 49).
; PLAN: r0=369(x), r1=139(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x), r6=49(y), r7=113(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 139
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 49
LDI r7, 113
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
