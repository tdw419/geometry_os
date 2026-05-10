; DESCRIPTION: Composite: Renders a green box of size 65x72 starting at (184, 35) then Sets a single purple pixel at (178, 220).
; PLAN: r0=184(x), r1=35(y), r2=65(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=220(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 184
LDI r1, 35
LDI r2, 65
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 220
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
