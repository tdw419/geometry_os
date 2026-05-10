; DESCRIPTION: Composite: Creates a blue rectangular region at (498, 119) spanning 13 by 79 pixels then Places a green dot at position (461, 181).
; PLAN: r0=498(x), r1=119(y), r2=13(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=181(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 498
LDI r1, 119
LDI r2, 13
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 181
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
