; DESCRIPTION: Composite: Renders a green box of size 26x95 starting at (455, 36) then Places a cyan dot at position (226, 37).
; PLAN: r0=455(x), r1=36(y), r2=26(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=37(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 455
LDI r1, 36
LDI r2, 26
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 37
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
