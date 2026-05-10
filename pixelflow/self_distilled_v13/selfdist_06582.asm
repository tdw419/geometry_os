; DESCRIPTION: Draws a white rectangle at (381, 168) with width 99 and height 107.
; PLAN: r0=381(x), r1=168(y), r2=99(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 168
LDI r2, 99
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
