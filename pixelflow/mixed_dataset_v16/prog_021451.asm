; DESCRIPTION: Composite: Places a black 34x45 rectangle at position (312, 62) then Places a black circle of radius 62 at center (237, 143).
; PLAN: r0=312(x), r1=62(y), r2=34(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=143(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 312
LDI r1, 62
LDI r2, 34
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 143
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
