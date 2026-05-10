; DESCRIPTION: Draws a white rectangle at (172, 0) with width 84 and height 72.
; PLAN: r0=172(x), r1=0(y), r2=84(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 0
LDI r2, 84
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
