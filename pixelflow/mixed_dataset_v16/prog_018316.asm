; DESCRIPTION: Composite: Sets a single green pixel at (255, 91) then Places a white 19x18 rectangle at position (141, 18).
; PLAN: r0=255(x), r1=91(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=18(y), r7=19(width), r8=18(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 91
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 141
LDI r6, 18
LDI r7, 19
LDI r8, 18
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
