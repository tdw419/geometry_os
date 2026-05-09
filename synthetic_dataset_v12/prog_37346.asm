; DESCRIPTION: Draws a orange rectangle at (57, 30) with width 24 and height 16.
; PLAN: r0=57(x), r1=30(y), r2=24(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 30
LDI r2, 24
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
