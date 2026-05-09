; DESCRIPTION: Composite: Renders a red box of size 107x19 starting at (375, 40) then Places a red dot at position (314, 53).
; PLAN: r0=375(x), r1=40(y), r2=107(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=53(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 375
LDI r1, 40
LDI r2, 107
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 53
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
