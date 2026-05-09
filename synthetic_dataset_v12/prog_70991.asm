; DESCRIPTION: Composite: Renders a green disk with center (220, 35) and radius 12 then Places a cyan 19x83 rectangle at position (206, 82) then Sets a single black pixel at (201, 23).
; PLAN: r0=220(x), r1=35(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=82(y), r7=19(width), r8=83(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x), r11=23(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 35
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 82
LDI r7, 19
LDI r8, 83
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 23
LDI r12, 0x000000
PSET r10, r11, r12
HALT
