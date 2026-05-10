; DESCRIPTION: Draws a green rectangle at (5, 96) with width 98 and height 24.
; PLAN: r0=5(x), r1=96(y), r2=98(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 96
LDI r2, 98
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
