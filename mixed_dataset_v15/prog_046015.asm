; DESCRIPTION: Draws a orange rectangle at (371, 142) with width 45 and height 74.
; PLAN: r0=371(x), r1=142(y), r2=45(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 142
LDI r2, 45
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
