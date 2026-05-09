; DESCRIPTION: Composite: Renders a magenta box of size 111x114 starting at (116, 16) then Places a cyan circle of radius 15 at center (291, 45).
; PLAN: r0=116(x), r1=16(y), r2=111(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=45(y), r7=15(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 116
LDI r1, 16
LDI r2, 111
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 45
LDI r7, 15
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
