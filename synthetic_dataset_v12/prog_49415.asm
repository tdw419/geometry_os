; DESCRIPTION: Composite: Renders a cyan box of size 107x53 starting at (385, 50) then Places a red dot at position (219, 217).
; PLAN: r0=385(x), r1=50(y), r2=107(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=217(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 385
LDI r1, 50
LDI r2, 107
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 217
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
