; DESCRIPTION: Draws a orange rectangle at (354, 29) with width 48 and height 97.
; PLAN: r0=354(x), r1=29(y), r2=48(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 29
LDI r2, 48
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
