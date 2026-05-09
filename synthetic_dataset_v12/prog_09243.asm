; DESCRIPTION: Composite: Renders a black box of size 32x17 starting at (278, 32) then Places a purple dot at position (165, 72).
; PLAN: r0=278(x), r1=32(y), r2=32(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=72(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 32
LDI r2, 32
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 72
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
