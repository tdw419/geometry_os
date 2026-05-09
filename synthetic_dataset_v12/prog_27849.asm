; DESCRIPTION: Composite: Renders a red disk with center (434, 216) and radius 35 then Renders a black box of size 11x91 starting at (190, 67).
; PLAN: r0=434(x), r1=216(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=67(y), r7=11(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 216
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 67
LDI r7, 11
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
