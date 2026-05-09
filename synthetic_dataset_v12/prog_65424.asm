; DESCRIPTION: Composite: Renders a green box of size 66x43 starting at (77, 139) then Places a blue dot at position (181, 239).
; PLAN: r0=77(x), r1=139(y), r2=66(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x), r6=239(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 139
LDI r2, 66
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 239
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
