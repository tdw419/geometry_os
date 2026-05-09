; DESCRIPTION: Draws a green rectangle at (209, 9) with width 32 and height 21.
; PLAN: r0=209(x), r1=9(y), r2=32(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 9
LDI r2, 32
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
