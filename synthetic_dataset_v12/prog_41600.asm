; DESCRIPTION: Draws a white rectangle at (57, 1) with width 58 and height 105.
; PLAN: r0=57(x), r1=1(y), r2=58(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 1
LDI r2, 58
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
