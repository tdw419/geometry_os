; DESCRIPTION: Composite: Renders a blue box of size 24x51 starting at (255, 5) then Places a blue dot at position (181, 151).
; PLAN: r0=255(x), r1=5(y), r2=24(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x), r6=151(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 5
LDI r2, 24
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 151
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
