; DESCRIPTION: Composite: Renders a white box of size 18x97 starting at (220, 24) then Places a yellow dot at position (447, 82).
; PLAN: r0=220(x), r1=24(y), r2=18(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=82(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 24
LDI r2, 18
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 82
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
