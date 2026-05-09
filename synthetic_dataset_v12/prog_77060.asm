; DESCRIPTION: Composite: Renders a orange box of size 55x30 starting at (37, 177) then Places a black dot at position (439, 93).
; PLAN: r0=37(x), r1=177(y), r2=55(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=93(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 37
LDI r1, 177
LDI r2, 55
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 93
LDI r7, 0x000000
PSET r5, r6, r7
HALT
