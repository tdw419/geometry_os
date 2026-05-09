; DESCRIPTION: Draws a white rectangle at (70, 34) with width 107 and height 44.
; PLAN: r0=70(x), r1=34(y), r2=107(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 34
LDI r2, 107
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
