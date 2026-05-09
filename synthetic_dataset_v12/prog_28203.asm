; DESCRIPTION: Composite: Places a black dot at position (0, 238) then Draws a purple rectangle at (226, 52) with width 25 and height 120.
; PLAN: r0=0(x), r1=238(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=52(y), r7=25(width), r8=120(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 238
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 226
LDI r6, 52
LDI r7, 25
LDI r8, 120
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
