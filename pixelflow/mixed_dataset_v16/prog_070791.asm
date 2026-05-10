; DESCRIPTION: Draws a green rectangle at (30, 236) with width 74 and height 11.
; PLAN: r0=30(x), r1=236(y), r2=74(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 236
LDI r2, 74
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
