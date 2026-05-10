; DESCRIPTION: Composite: Places a black 49x115 rectangle at position (329, 99) then Places a white circle of radius 45 at center (294, 114).
; PLAN: r0=329(x), r1=99(y), r2=49(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=114(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 99
LDI r2, 49
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 114
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
