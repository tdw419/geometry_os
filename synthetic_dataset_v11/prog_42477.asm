; DESCRIPTION: Draws a yellow rectangle at (159, 16) with width 24 and height 85.
; PLAN: r0=159(x), r1=16(y), r2=24(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 16
LDI r2, 24
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
