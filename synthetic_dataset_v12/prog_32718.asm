; DESCRIPTION: Composite: Renders a green box of size 55x93 starting at (209, 10) then Places a blue dot at position (508, 104).
; PLAN: r0=209(x), r1=10(y), r2=55(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=508(x), r6=104(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 10
LDI r2, 55
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 104
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
