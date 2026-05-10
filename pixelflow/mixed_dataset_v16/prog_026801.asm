; DESCRIPTION: Composite: Draws a red rectangle at (136, 237) with width 115 and height 19 then Sets a single green pixel at (50, 36).
; PLAN: r0=136(x), r1=237(y), r2=115(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x), r6=36(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 136
LDI r1, 237
LDI r2, 115
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 36
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
