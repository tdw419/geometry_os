; DESCRIPTION: Composite: Renders a purple box of size 15x73 starting at (134, 161) then Places a purple dot at position (0, 159).
; PLAN: r0=134(x), r1=161(y), r2=15(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x), r6=159(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 161
LDI r2, 15
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 159
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
