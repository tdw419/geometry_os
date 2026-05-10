; DESCRIPTION: Composite: Renders a white disk with center (77, 162) and radius 72 then Places a white 76x19 rectangle at position (378, 231).
; PLAN: r0=77(x), r1=162(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x), r6=231(y), r7=76(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 162
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 231
LDI r7, 76
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
