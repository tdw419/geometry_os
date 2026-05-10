; DESCRIPTION: Composite: Sets a single purple pixel at (286, 73) then Draws a orange rectangle at (327, 127) with width 99 and height 88.
; PLAN: r0=286(x), r1=73(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=127(y), r7=99(width), r8=88(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 73
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 127
LDI r7, 99
LDI r8, 88
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
