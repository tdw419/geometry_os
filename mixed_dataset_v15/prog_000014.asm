; DESCRIPTION: Composite: Sets a single orange pixel at (256, 25) then Draws a blue rectangle at (134, 80) with width 72 and height 108.
; PLAN: r0=256(x), r1=25(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=134(x), r6=80(y), r7=72(width), r8=108(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 25
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 134
LDI r6, 80
LDI r7, 72
LDI r8, 108
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
