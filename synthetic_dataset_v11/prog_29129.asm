; DESCRIPTION: Draws a white rectangle at (76, 14) with width 48 and height 99.
; PLAN: r0=76(x), r1=14(y), r2=48(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 14
LDI r2, 48
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
