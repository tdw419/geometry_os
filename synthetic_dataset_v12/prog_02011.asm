; DESCRIPTION: Draws a white rectangle at (16, 80) with width 112 and height 107.
; PLAN: r0=16(x), r1=80(y), r2=112(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 80
LDI r2, 112
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
