; DESCRIPTION: Composite: Draws a white rectangle at (22, 40) with width 44 and height 78 then Sets a single red pixel at (48, 195).
; PLAN: r0=22(x), r1=40(y), r2=44(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=48(x), r6=195(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 22
LDI r1, 40
LDI r2, 44
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 195
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
