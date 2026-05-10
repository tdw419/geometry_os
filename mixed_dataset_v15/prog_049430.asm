; DESCRIPTION: Draws a white rectangle at (86, 37) with width 72 and height 22.
; PLAN: r0=86(x), r1=37(y), r2=72(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 37
LDI r2, 72
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
