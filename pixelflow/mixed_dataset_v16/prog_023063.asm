; DESCRIPTION: Composite: Draws a white rectangle at (102, 162) with width 109 and height 20 then Sets a single red pixel at (204, 46).
; PLAN: r0=102(x), r1=162(y), r2=109(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=46(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 102
LDI r1, 162
LDI r2, 109
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 46
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
