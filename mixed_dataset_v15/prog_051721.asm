; DESCRIPTION: Composite: Places a red circle of radius 17 at center (114, 157) then Renders a black box of size 111x76 starting at (170, 31).
; PLAN: r0=114(x), r1=157(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=31(y), r7=111(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 157
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 31
LDI r7, 111
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
