; DESCRIPTION: Draws a orange rectangle at (33, 39) with width 83 and height 50.
; PLAN: r0=33(x), r1=39(y), r2=83(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 39
LDI r2, 83
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
