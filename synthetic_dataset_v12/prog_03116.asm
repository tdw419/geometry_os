; DESCRIPTION: Composite: Renders a cyan disk with center (97, 90) and radius 75 then Places a white 75x35 rectangle at position (190, 156).
; PLAN: r0=97(x), r1=90(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=156(y), r7=75(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 90
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 156
LDI r7, 75
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
