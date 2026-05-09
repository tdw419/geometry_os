; DESCRIPTION: Draws a orange rectangle at (371, 98) with width 22 and height 39.
; PLAN: r0=371(x), r1=98(y), r2=22(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 98
LDI r2, 22
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
