; DESCRIPTION: Draws a white rectangle at (64, 39) with width 40 and height 80.
; PLAN: r0=64(x), r1=39(y), r2=40(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 39
LDI r2, 40
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
