; DESCRIPTION: Composite: Creates a blue circular shape at (105, 139) with radius 44 then Places a white 97x93 rectangle at position (4, 5) then Sets a single black pixel at (275, 164).
; PLAN: r0=105(x), r1=139(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x), r6=5(y), r7=97(width), r8=93(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=275(x), r11=164(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 139
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 5
LDI r7, 97
LDI r8, 93
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 164
LDI r12, 0x000000
PSET r10, r11, r12
HALT
