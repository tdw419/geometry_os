; DESCRIPTION: Draws a white rectangle at (40, 189) with width 86 and height 26.
; PLAN: r0=40(x), r1=189(y), r2=86(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 189
LDI r2, 86
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
