; DESCRIPTION: Composite: Renders a purple box of size 108x57 starting at (17, 138) then Sets a single orange pixel at (241, 13).
; PLAN: r0=17(x), r1=138(y), r2=108(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=13(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 17
LDI r1, 138
LDI r2, 108
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 13
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
