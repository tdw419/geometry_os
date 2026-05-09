; DESCRIPTION: Draws a orange rectangle at (225, 213) with width 53 and height 10.
; PLAN: r0=225(x), r1=213(y), r2=53(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 213
LDI r2, 53
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
