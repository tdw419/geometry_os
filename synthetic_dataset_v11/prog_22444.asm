; DESCRIPTION: Draws a white rectangle at (109, 53) with width 76 and height 66.
; PLAN: r0=109(x), r1=53(y), r2=76(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 53
LDI r2, 76
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
