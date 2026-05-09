; DESCRIPTION: Composite: Renders a blue box of size 64x77 starting at (376, 71) then Places a red circle of radius 64 at center (322, 176).
; PLAN: r0=376(x), r1=71(y), r2=64(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x), r6=176(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 376
LDI r1, 71
LDI r2, 64
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 176
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
