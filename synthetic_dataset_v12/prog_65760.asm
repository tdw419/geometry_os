; DESCRIPTION: Draws a cyan rectangle at (310, 100) with width 96 and height 100.
; PLAN: r0=310(x), r1=100(y), r2=96(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 100
LDI r2, 96
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
