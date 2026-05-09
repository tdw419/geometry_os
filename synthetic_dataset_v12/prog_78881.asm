; DESCRIPTION: Draws a white rectangle at (247, 43) with width 32 and height 43.
; PLAN: r0=247(x), r1=43(y), r2=32(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 43
LDI r2, 32
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
