; DESCRIPTION: Composite: Places a green circle of radius 30 at center (126, 30) then Places a magenta dot at position (157, 203).
; PLAN: r0=126(x), r1=30(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=203(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 126
LDI r1, 30
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 203
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
