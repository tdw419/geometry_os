; DESCRIPTION: Draws a black rectangle at (117, 76) with width 12 and height 16.
; PLAN: r0=117(x), r1=76(y), r2=12(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 76
LDI r2, 12
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
