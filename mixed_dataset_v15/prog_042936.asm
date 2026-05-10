; DESCRIPTION: Draws a green rectangle at (418, 96) with width 68 and height 108.
; PLAN: r0=418(x), r1=96(y), r2=68(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 96
LDI r2, 68
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
