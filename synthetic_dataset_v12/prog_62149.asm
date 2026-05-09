; DESCRIPTION: Composite: Draws a cyan circle centered at (239, 55) with radius 37 then Renders a magenta box of size 57x61 starting at (159, 126) then Sets a single green pixel at (402, 176).
; PLAN: r0=239(x), r1=55(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=126(y), r7=57(width), r8=61(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=402(x), r11=176(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 239
LDI r1, 55
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 126
LDI r7, 57
LDI r8, 61
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 176
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
