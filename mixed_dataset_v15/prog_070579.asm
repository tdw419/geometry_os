; DESCRIPTION: Composite: Draws a yellow rectangle at (217, 163) with width 66 and height 76 then Sets a single cyan pixel at (19, 87).
; PLAN: r0=217(x), r1=163(y), r2=66(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=87(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 217
LDI r1, 163
LDI r2, 66
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 87
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
