; DESCRIPTION: Composite: Places a purple 41x52 rectangle at position (215, 179) then Renders a white disk with center (83, 138) and radius 62.
; PLAN: r0=215(x), r1=179(y), r2=41(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=138(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 179
LDI r2, 41
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 138
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
