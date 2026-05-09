; DESCRIPTION: Composite: Renders a purple box of size 101x119 starting at (172, 106) then Places a blue dot at position (20, 46).
; PLAN: r0=172(x), r1=106(y), r2=101(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x), r6=46(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 106
LDI r2, 101
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 46
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
