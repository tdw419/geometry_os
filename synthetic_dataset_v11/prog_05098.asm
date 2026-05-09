; DESCRIPTION: Draws a white rectangle at (206, 115) with width 30 and height 107.
; PLAN: r0=206(x), r1=115(y), r2=30(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 115
LDI r2, 30
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
