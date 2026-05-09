; DESCRIPTION: Composite: Draws a orange rectangle at (147, 92) with width 29 and height 65 then Places a orange dot at position (235, 209).
; PLAN: r0=147(x), r1=92(y), r2=29(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=209(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 147
LDI r1, 92
LDI r2, 29
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 209
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
