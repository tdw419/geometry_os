; DESCRIPTION: Composite: Sets a single yellow pixel at (74, 164) then Draws a blue rectangle at (100, 16) with width 83 and height 62.
; PLAN: r0=74(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=16(y), r7=83(width), r8=62(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 100
LDI r6, 16
LDI r7, 83
LDI r8, 62
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
