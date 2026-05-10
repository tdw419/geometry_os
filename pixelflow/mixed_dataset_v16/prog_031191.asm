; DESCRIPTION: Composite: Places a magenta 112x24 rectangle at position (18, 151) then Places a purple dot at position (112, 245).
; PLAN: r0=18(x), r1=151(y), r2=112(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=245(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 18
LDI r1, 151
LDI r2, 112
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 245
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
