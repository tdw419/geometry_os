; DESCRIPTION: Composite: Places a green dot at position (442, 214) then Places a cyan 35x37 rectangle at position (318, 126).
; PLAN: r0=442(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=126(y), r7=35(width), r8=37(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 214
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 318
LDI r6, 126
LDI r7, 35
LDI r8, 37
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
