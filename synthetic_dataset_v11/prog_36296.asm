; DESCRIPTION: Draws a black rectangle at (11, 93) with width 98 and height 61.
; PLAN: r0=11(x), r1=93(y), r2=98(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 93
LDI r2, 98
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
