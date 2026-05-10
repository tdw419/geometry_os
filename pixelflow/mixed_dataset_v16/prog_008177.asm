; DESCRIPTION: Composite: Renders a black box of size 107x115 starting at (295, 51) then Sets a single white pixel at (492, 45).
; PLAN: r0=295(x), r1=51(y), r2=107(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x), r6=45(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 295
LDI r1, 51
LDI r2, 107
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 45
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
