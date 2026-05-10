; DESCRIPTION: Draws a white rectangle at (196, 159) with width 73 and height 34.
; PLAN: r0=196(x), r1=159(y), r2=73(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 159
LDI r2, 73
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
