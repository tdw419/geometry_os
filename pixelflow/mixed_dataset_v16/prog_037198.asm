; DESCRIPTION: Composite: Renders a blue box of size 101x56 starting at (333, 76) then Places a black dot at position (436, 61).
; PLAN: r0=333(x), r1=76(y), r2=101(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=61(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 76
LDI r2, 101
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 61
LDI r7, 0x000000
PSET r5, r6, r7
HALT
