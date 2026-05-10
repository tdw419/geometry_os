; DESCRIPTION: Draws a orange rectangle at (151, 171) with width 110 and height 12.
; PLAN: r0=151(x), r1=171(y), r2=110(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 171
LDI r2, 110
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
