; DESCRIPTION: Draws a white rectangle at (382, 97) with width 103 and height 40.
; PLAN: r0=382(x), r1=97(y), r2=103(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 97
LDI r2, 103
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
