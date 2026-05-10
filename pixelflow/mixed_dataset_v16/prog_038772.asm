; DESCRIPTION: Composite: Sets a single green pixel at (130, 132) then Places a red 17x104 rectangle at position (151, 69).
; PLAN: r0=130(x), r1=132(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=151(x), r6=69(y), r7=17(width), r8=104(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 132
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 151
LDI r6, 69
LDI r7, 17
LDI r8, 104
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
