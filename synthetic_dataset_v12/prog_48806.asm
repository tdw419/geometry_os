; DESCRIPTION: Composite: Draws a orange rectangle at (421, 79) with width 34 and height 45 then Sets a single cyan pixel at (107, 195).
; PLAN: r0=421(x), r1=79(y), r2=34(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=195(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 79
LDI r2, 34
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 195
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
