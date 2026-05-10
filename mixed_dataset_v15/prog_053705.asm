; DESCRIPTION: Composite: Draws a red rectangle at (268, 192) with width 119 and height 50 then Sets a single cyan pixel at (156, 59).
; PLAN: r0=268(x), r1=192(y), r2=119(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=59(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 192
LDI r2, 119
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 59
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
