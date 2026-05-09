; DESCRIPTION: Composite: Renders a purple box of size 60x64 starting at (191, 45) then Places a blue dot at position (364, 164).
; PLAN: r0=191(x), r1=45(y), r2=60(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=164(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 45
LDI r2, 60
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 164
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
