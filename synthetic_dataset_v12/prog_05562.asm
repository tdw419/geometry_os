; DESCRIPTION: Composite: Renders a yellow disk with center (263, 203) and radius 38 then Renders a black box of size 16x114 starting at (309, 14).
; PLAN: r0=263(x), r1=203(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=14(y), r7=16(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 203
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 14
LDI r7, 16
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
