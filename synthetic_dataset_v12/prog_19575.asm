; DESCRIPTION: Composite: Places a black 43x95 rectangle at position (420, 122) then Places a yellow dot at position (53, 254).
; PLAN: r0=420(x), r1=122(y), r2=43(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=254(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 420
LDI r1, 122
LDI r2, 43
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 254
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
