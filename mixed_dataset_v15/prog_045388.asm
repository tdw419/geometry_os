; DESCRIPTION: Draws a white rectangle at (196, 97) with width 49 and height 91.
; PLAN: r0=196(x), r1=97(y), r2=49(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 97
LDI r2, 49
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
