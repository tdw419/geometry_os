; DESCRIPTION: Draws a white rectangle at (11, 30) with width 103 and height 13.
; PLAN: r0=11(x), r1=30(y), r2=103(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 30
LDI r2, 103
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
