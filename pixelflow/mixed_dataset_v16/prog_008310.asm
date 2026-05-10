; DESCRIPTION: Composite: Draws a white rectangle at (21, 167) with width 87 and height 63 then Places a red dot at position (272, 77).
; PLAN: r0=21(x), r1=167(y), r2=87(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=77(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 21
LDI r1, 167
LDI r2, 87
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 77
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
