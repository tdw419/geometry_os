; DESCRIPTION: Composite: Places a red circle of radius 25 at center (257, 197) then Renders a white box of size 89x41 starting at (404, 26) then Sets a single cyan pixel at (473, 37).
; PLAN: r0=257(x), r1=197(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=26(y), r7=89(width), r8=41(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=473(x), r11=37(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 197
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 26
LDI r7, 89
LDI r8, 41
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 473
LDI r11, 37
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
