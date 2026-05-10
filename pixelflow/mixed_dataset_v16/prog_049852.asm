; DESCRIPTION: Composite: Places a black 119x57 rectangle at position (315, 195) then Places a black circle of radius 52 at center (77, 189).
; PLAN: r0=315(x), r1=195(y), r2=119(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=189(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 195
LDI r2, 119
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 189
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
