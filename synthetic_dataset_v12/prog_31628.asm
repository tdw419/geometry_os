; DESCRIPTION: Composite: Places a blue dot at position (98, 140) then Places a magenta 20x19 rectangle at position (26, 184).
; PLAN: r0=98(x), r1=140(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=26(x), r6=184(y), r7=20(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 140
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 26
LDI r6, 184
LDI r7, 20
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
