; DESCRIPTION: Composite: Draws a red rectangle at (75, 4) with width 82 and height 63 then Places a white dot at position (191, 211).
; PLAN: r0=75(x), r1=4(y), r2=82(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=211(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 4
LDI r2, 82
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 211
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
