; DESCRIPTION: Draws a white rectangle at (117, 237) with width 110 and height 13.
; PLAN: r0=117(x), r1=237(y), r2=110(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 237
LDI r2, 110
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
