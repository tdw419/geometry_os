; DESCRIPTION: Draws a white rectangle at (107, 141) with width 75 and height 46.
; PLAN: r0=107(x), r1=141(y), r2=75(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 141
LDI r2, 75
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
