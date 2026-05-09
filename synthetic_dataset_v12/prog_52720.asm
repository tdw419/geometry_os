; DESCRIPTION: Composite: Renders a green box of size 76x95 starting at (253, 44) then Places a black dot at position (57, 65).
; PLAN: r0=253(x), r1=44(y), r2=76(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x), r6=65(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 44
LDI r2, 76
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 65
LDI r7, 0x000000
PSET r5, r6, r7
HALT
