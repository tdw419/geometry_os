; DESCRIPTION: Draws a black rectangle at (467, 98) with width 19 and height 77.
; PLAN: r0=467(x), r1=98(y), r2=19(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 98
LDI r2, 19
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
