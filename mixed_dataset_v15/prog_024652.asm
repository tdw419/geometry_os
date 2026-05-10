; DESCRIPTION: Composite: Draws a cyan rectangle at (173, 82) with width 65 and height 66 then Sets a single cyan pixel at (151, 100).
; PLAN: r0=173(x), r1=82(y), r2=65(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=100(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 173
LDI r1, 82
LDI r2, 65
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 100
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
