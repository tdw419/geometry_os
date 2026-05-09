; DESCRIPTION: Draws a white rectangle at (99, 143) with width 24 and height 33.
; PLAN: r0=99(x), r1=143(y), r2=24(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 143
LDI r2, 24
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
