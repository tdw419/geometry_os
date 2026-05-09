; DESCRIPTION: Composite: Renders a white box of size 51x93 starting at (381, 118) then Places a blue dot at position (302, 47).
; PLAN: r0=381(x), r1=118(y), r2=51(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=47(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 381
LDI r1, 118
LDI r2, 51
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 47
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
