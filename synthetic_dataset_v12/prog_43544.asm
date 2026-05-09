; DESCRIPTION: Composite: Renders a black box of size 12x102 starting at (299, 17) then Sets a single red pixel at (306, 128).
; PLAN: r0=299(x), r1=17(y), r2=12(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=128(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 299
LDI r1, 17
LDI r2, 12
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 128
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
