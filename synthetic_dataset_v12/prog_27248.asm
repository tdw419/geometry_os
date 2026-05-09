; DESCRIPTION: Draws a orange rectangle at (191, 209) with width 75 and height 17.
; PLAN: r0=191(x), r1=209(y), r2=75(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 209
LDI r2, 75
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
