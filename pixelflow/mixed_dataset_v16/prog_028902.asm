; DESCRIPTION: Composite: Renders a green disk with center (348, 117) and radius 74 then Places a black 14x22 rectangle at position (18, 163).
; PLAN: r0=348(x), r1=117(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x), r6=163(y), r7=14(width), r8=22(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 117
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 163
LDI r7, 14
LDI r8, 22
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
