; DESCRIPTION: Composite: Draws a red rectangle at (32, 187) with width 37 and height 65 then Sets a single cyan pixel at (26, 188).
; PLAN: r0=32(x), r1=187(y), r2=37(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=188(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 187
LDI r2, 37
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 188
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
