; DESCRIPTION: Draws a white rectangle at (263, 2) with width 26 and height 73.
; PLAN: r0=263(x), r1=2(y), r2=26(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 2
LDI r2, 26
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
