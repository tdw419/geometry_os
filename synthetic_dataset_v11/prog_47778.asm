; DESCRIPTION: Draws a orange rectangle at (17, 200) with width 21 and height 24.
; PLAN: r0=17(x), r1=200(y), r2=21(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 200
LDI r2, 21
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
