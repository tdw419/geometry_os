; DESCRIPTION: Draws a orange rectangle at (219, 96) with width 28 and height 93.
; PLAN: r0=219(x), r1=96(y), r2=28(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 96
LDI r2, 28
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
