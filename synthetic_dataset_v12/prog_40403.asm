; DESCRIPTION: Draws a white rectangle at (156, 21) with width 40 and height 28.
; PLAN: r0=156(x), r1=21(y), r2=40(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 21
LDI r2, 40
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
