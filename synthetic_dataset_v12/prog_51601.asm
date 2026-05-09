; DESCRIPTION: Draws a yellow rectangle at (291, 16) with width 85 and height 119.
; PLAN: r0=291(x), r1=16(y), r2=85(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 16
LDI r2, 85
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
