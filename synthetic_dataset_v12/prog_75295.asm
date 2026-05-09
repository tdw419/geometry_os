; DESCRIPTION: Composite: Draws a green circle centered at (363, 167) with radius 71 then Places a red 16x83 rectangle at position (171, 80) then Sets a single magenta pixel at (83, 150).
; PLAN: r0=363(x), r1=167(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=80(y), r7=16(width), r8=83(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=83(x), r11=150(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 167
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 80
LDI r7, 16
LDI r8, 83
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 150
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
