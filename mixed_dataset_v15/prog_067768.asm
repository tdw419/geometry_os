; DESCRIPTION: Composite: Renders a black disk with center (432, 184) and radius 30 then Creates a cyan rectangular region at (328, 74) spanning 28 by 28 pixels.
; PLAN: r0=432(x), r1=184(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=74(y), r7=28(width), r8=28(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 184
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 74
LDI r7, 28
LDI r8, 28
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
