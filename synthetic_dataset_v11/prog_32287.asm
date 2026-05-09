; DESCRIPTION: Draws a white rectangle at (24, 53) with width 50 and height 112.
; PLAN: r0=24(x), r1=53(y), r2=50(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 53
LDI r2, 50
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
