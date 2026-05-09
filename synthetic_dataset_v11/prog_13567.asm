; DESCRIPTION: Draws a white rectangle at (183, 48) with width 35 and height 64.
; PLAN: r0=183(x), r1=48(y), r2=35(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 48
LDI r2, 35
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
