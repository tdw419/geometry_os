; DESCRIPTION: Draws a white rectangle at (94, 140) with width 26 and height 86.
; PLAN: r0=94(x), r1=140(y), r2=26(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 140
LDI r2, 26
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
