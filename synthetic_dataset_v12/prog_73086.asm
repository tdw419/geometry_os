; DESCRIPTION: Composite: Draws a white rectangle at (58, 16) with width 80 and height 100 then Sets a single purple pixel at (405, 145).
; PLAN: r0=58(x), r1=16(y), r2=80(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=145(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 58
LDI r1, 16
LDI r2, 80
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 145
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
