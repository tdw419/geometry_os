; DESCRIPTION: Composite: Draws a yellow rectangle at (408, 41) with width 76 and height 90 then Sets a single orange pixel at (462, 27).
; PLAN: r0=408(x), r1=41(y), r2=76(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=27(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 41
LDI r2, 76
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 27
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
