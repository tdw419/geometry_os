; DESCRIPTION: Composite: Renders a green box of size 51x64 starting at (49, 76) then Sets a single magenta pixel at (17, 35).
; PLAN: r0=49(x), r1=76(y), r2=51(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=35(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 49
LDI r1, 76
LDI r2, 51
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 35
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
