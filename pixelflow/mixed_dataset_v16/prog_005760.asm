; DESCRIPTION: Composite: Places a magenta 40x85 rectangle at position (374, 6) then Sets a single blue pixel at (456, 115).
; PLAN: r0=374(x), r1=6(y), r2=40(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=115(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 6
LDI r2, 40
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 115
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
