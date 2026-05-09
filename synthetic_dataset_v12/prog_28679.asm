; DESCRIPTION: Draws a white rectangle at (103, 161) with width 24 and height 11.
; PLAN: r0=103(x), r1=161(y), r2=24(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 161
LDI r2, 24
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
