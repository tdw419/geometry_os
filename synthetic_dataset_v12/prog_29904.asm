; DESCRIPTION: Composite: Draws a purple rectangle at (177, 161) with width 25 and height 25 then Sets a single red pixel at (171, 248).
; PLAN: r0=177(x), r1=161(y), r2=25(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=248(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 161
LDI r2, 25
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 248
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
