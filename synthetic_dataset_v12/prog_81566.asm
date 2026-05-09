; DESCRIPTION: Composite: Renders a purple box of size 30x29 starting at (332, 122) then Sets a single black pixel at (269, 82).
; PLAN: r0=332(x), r1=122(y), r2=30(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x), r6=82(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 122
LDI r2, 30
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 82
LDI r7, 0x000000
PSET r5, r6, r7
HALT
