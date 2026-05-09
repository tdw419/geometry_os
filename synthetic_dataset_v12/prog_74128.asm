; DESCRIPTION: Draws a orange rectangle at (365, 173) with width 35 and height 40.
; PLAN: r0=365(x), r1=173(y), r2=35(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 173
LDI r2, 35
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
