; DESCRIPTION: Composite: Places a black 20x94 rectangle at position (215, 17) then Sets a single black pixel at (136, 234).
; PLAN: r0=215(x), r1=17(y), r2=20(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=234(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 215
LDI r1, 17
LDI r2, 20
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 234
LDI r7, 0x000000
PSET r5, r6, r7
HALT
