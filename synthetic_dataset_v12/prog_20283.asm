; DESCRIPTION: Draws a white rectangle at (226, 32) with width 53 and height 13.
; PLAN: r0=226(x), r1=32(y), r2=53(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 32
LDI r2, 53
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
