; DESCRIPTION: Draws a white rectangle at (433, 108) with width 39 and height 110.
; PLAN: r0=433(x), r1=108(y), r2=39(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 108
LDI r2, 39
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
