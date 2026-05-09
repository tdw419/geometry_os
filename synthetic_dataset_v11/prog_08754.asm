; DESCRIPTION: Draws a black rectangle at (52, 36) with width 98 and height 83.
; PLAN: r0=52(x), r1=36(y), r2=98(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 36
LDI r2, 98
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
