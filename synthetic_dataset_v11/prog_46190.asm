; DESCRIPTION: Draws a white rectangle at (157, 165) with width 73 and height 45.
; PLAN: r0=157(x), r1=165(y), r2=73(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 165
LDI r2, 73
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
