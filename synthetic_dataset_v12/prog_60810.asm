; DESCRIPTION: Composite: Renders a red disk with center (241, 94) and radius 71 then Renders a purple box of size 66x19 starting at (379, 122).
; PLAN: r0=241(x), r1=94(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=122(y), r7=66(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 94
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 122
LDI r7, 66
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
