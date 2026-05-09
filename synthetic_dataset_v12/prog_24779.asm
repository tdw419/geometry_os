; DESCRIPTION: Composite: Creates a green rectangular region at (374, 172) spanning 35 by 66 pixels then Places a black dot at position (130, 37).
; PLAN: r0=374(x), r1=172(y), r2=35(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=37(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 172
LDI r2, 35
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 37
LDI r7, 0x000000
PSET r5, r6, r7
HALT
