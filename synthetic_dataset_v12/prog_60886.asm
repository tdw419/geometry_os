; DESCRIPTION: Draws a orange rectangle at (419, 148) with width 53 and height 32.
; PLAN: r0=419(x), r1=148(y), r2=53(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 148
LDI r2, 53
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
