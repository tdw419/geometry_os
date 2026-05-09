; DESCRIPTION: Draws a green rectangle at (338, 83) with width 16 and height 20.
; PLAN: r0=338(x), r1=83(y), r2=16(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 83
LDI r2, 16
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
