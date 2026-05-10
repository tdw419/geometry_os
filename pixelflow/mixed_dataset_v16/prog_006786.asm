; DESCRIPTION: Composite: Places a black circle of radius 29 at center (108, 194) then Renders a yellow box of size 64x102 starting at (348, 8).
; PLAN: r0=108(x), r1=194(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=8(y), r7=64(width), r8=102(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 194
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 8
LDI r7, 64
LDI r8, 102
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
