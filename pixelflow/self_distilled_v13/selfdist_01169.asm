; DESCRIPTION: Draws a white rectangle at (299, 70) with width 28 and height 72.
; PLAN: r0=299(x), r1=70(y), r2=28(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 70
LDI r2, 28
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
