; DESCRIPTION: Draws a white rectangle at (36, 37) with width 107 and height 24.
; PLAN: r0=36(x), r1=37(y), r2=107(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 37
LDI r2, 107
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
