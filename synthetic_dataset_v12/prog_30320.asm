; DESCRIPTION: Draws a black rectangle at (425, 193) with width 49 and height 37.
; PLAN: r0=425(x), r1=193(y), r2=49(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 193
LDI r2, 49
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
