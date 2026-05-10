; DESCRIPTION: Composite: Sets a single purple pixel at (164, 96) then Draws a black rectangle at (146, 43) with width 52 and height 89.
; PLAN: r0=164(x), r1=96(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=146(x), r6=43(y), r7=52(width), r8=89(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 96
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 43
LDI r7, 52
LDI r8, 89
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
