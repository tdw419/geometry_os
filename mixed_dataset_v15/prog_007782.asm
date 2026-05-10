; DESCRIPTION: Composite: Creates a red circular shape at (109, 190) with radius 25 then Draws a blue rectangle at (275, 30) with width 52 and height 97 then Sets a single green pixel at (4, 140).
; PLAN: r0=109(x), r1=190(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=30(y), r7=52(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=4(x), r11=140(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 109
LDI r1, 190
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 30
LDI r7, 52
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 140
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
