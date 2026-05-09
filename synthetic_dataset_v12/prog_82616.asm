; DESCRIPTION: Composite: Renders a blue box of size 93x29 starting at (134, 96) then Places a black dot at position (457, 154).
; PLAN: r0=134(x), r1=96(y), r2=93(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x), r6=154(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 96
LDI r2, 93
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 154
LDI r7, 0x000000
PSET r5, r6, r7
HALT
