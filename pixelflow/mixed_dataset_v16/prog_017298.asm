; DESCRIPTION: Composite: Draws a yellow rectangle at (330, 9) with width 101 and height 119 then Sets a single green pixel at (255, 200).
; PLAN: r0=330(x), r1=9(y), r2=101(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=200(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 9
LDI r2, 101
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 200
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
