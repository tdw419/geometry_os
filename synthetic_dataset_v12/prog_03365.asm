; DESCRIPTION: Composite: Creates a green rectangular region at (155, 198) spanning 103 by 37 pixels then Places a cyan dot at position (172, 45).
; PLAN: r0=155(x), r1=198(y), r2=103(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=45(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 198
LDI r2, 103
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 45
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
