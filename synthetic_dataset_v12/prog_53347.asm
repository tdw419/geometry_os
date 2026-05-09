; DESCRIPTION: Composite: Renders a white box of size 45x66 starting at (115, 3) then Places a purple dot at position (166, 211).
; PLAN: r0=115(x), r1=3(y), r2=45(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x), r6=211(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 115
LDI r1, 3
LDI r2, 45
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 211
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
