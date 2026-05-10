; DESCRIPTION: Composite: Draws a purple rectangle at (115, 166) with width 16 and height 65 then Places a cyan dot at position (260, 139).
; PLAN: r0=115(x), r1=166(y), r2=16(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=139(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 115
LDI r1, 166
LDI r2, 16
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 139
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
