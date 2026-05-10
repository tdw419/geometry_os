; DESCRIPTION: Composite: Sets a single green pixel at (421, 70) then Places a white 112x105 rectangle at position (335, 44).
; PLAN: r0=421(x), r1=70(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=44(y), r7=112(width), r8=105(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 70
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 335
LDI r6, 44
LDI r7, 112
LDI r8, 105
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
