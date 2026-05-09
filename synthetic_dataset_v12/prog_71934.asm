; DESCRIPTION: Composite: Renders a blue box of size 13x78 starting at (125, 43) then Sets a single black pixel at (456, 39).
; PLAN: r0=125(x), r1=43(y), r2=13(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=39(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 125
LDI r1, 43
LDI r2, 13
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 39
LDI r7, 0x000000
PSET r5, r6, r7
HALT
