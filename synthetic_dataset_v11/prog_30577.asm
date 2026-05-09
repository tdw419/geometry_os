; DESCRIPTION: Draws a black rectangle at (143, 124) with width 13 and height 105.
; PLAN: r0=143(x), r1=124(y), r2=13(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 124
LDI r2, 13
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
