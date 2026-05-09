; DESCRIPTION: Draws a orange rectangle at (198, 148) with width 52 and height 15.
; PLAN: r0=198(x), r1=148(y), r2=52(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 148
LDI r2, 52
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
