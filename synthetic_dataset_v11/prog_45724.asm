; DESCRIPTION: Draws a green rectangle at (7, 103) with width 20 and height 76.
; PLAN: r0=7(x), r1=103(y), r2=20(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 103
LDI r2, 20
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
