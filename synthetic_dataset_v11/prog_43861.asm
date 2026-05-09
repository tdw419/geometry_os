; DESCRIPTION: Draws a orange rectangle at (174, 209) with width 70 and height 33.
; PLAN: r0=174(x), r1=209(y), r2=70(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 209
LDI r2, 70
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
