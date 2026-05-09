; DESCRIPTION: Draws a orange rectangle at (39, 163) with width 53 and height 83.
; PLAN: r0=39(x), r1=163(y), r2=53(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 163
LDI r2, 53
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
