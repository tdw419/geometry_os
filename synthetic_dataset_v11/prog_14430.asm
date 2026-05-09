; DESCRIPTION: Draws a white rectangle at (150, 114) with width 94 and height 99.
; PLAN: r0=150(x), r1=114(y), r2=94(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 114
LDI r2, 94
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
