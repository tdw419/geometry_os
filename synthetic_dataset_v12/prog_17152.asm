; DESCRIPTION: Draws a white rectangle at (371, 167) with width 37 and height 86.
; PLAN: r0=371(x), r1=167(y), r2=37(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 167
LDI r2, 37
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
