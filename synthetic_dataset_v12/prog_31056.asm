; DESCRIPTION: Draws a orange rectangle at (243, 10) with width 17 and height 83.
; PLAN: r0=243(x), r1=10(y), r2=17(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 10
LDI r2, 17
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
