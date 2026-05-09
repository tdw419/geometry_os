; DESCRIPTION: Draws a green rectangle at (120, 20) with width 28 and height 96.
; PLAN: r0=120(x), r1=20(y), r2=28(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 20
LDI r2, 28
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
