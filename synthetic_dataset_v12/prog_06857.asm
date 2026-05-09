; DESCRIPTION: Draws a black rectangle at (419, 182) with width 47 and height 60.
; PLAN: r0=419(x), r1=182(y), r2=47(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 182
LDI r2, 47
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
