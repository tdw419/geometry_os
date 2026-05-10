; DESCRIPTION: Composite: Renders a orange disk with center (39, 228) and radius 23 then Draws a green rectangle at (415, 24) with width 64 and height 34 then Sets a single red pixel at (183, 11).
; PLAN: r0=39(x), r1=228(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x), r6=24(y), r7=64(width), r8=34(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=183(x), r11=11(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 228
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 24
LDI r7, 64
LDI r8, 34
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 11
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
