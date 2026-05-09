; DESCRIPTION: Composite: Renders a white box of size 111x19 starting at (301, 198) then Places a black dot at position (234, 216).
; PLAN: r0=301(x), r1=198(y), r2=111(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=216(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 198
LDI r2, 111
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 216
LDI r7, 0x000000
PSET r5, r6, r7
HALT
