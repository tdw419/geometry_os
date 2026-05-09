; DESCRIPTION: Draws a white rectangle at (86, 94) with width 40 and height 44.
; PLAN: r0=86(x), r1=94(y), r2=40(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 94
LDI r2, 40
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
