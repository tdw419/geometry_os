; DESCRIPTION: Draws a white rectangle at (185, 134) with width 44 and height 28.
; PLAN: r0=185(x), r1=134(y), r2=44(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 134
LDI r2, 44
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
