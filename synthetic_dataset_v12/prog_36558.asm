; DESCRIPTION: Draws a white rectangle at (288, 178) with width 64 and height 38.
; PLAN: r0=288(x), r1=178(y), r2=64(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 178
LDI r2, 64
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
