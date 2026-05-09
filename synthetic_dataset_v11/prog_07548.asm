; DESCRIPTION: Draws a white rectangle at (50, 39) with width 17 and height 23.
; PLAN: r0=50(x), r1=39(y), r2=17(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 39
LDI r2, 17
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
