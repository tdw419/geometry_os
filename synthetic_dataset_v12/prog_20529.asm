; DESCRIPTION: Composite: Draws a orange rectangle at (57, 97) with width 87 and height 100 then Sets a single white pixel at (346, 235).
; PLAN: r0=57(x), r1=97(y), r2=87(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=235(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 97
LDI r2, 87
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 235
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
