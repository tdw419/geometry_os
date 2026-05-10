; DESCRIPTION: Composite: Renders a black box of size 18x26 starting at (178, 135) then Sets a single purple pixel at (341, 46).
; PLAN: r0=178(x), r1=135(y), r2=18(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x), r6=46(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 135
LDI r2, 18
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 46
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
