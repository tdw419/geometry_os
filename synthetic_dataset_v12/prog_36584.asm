; DESCRIPTION: Draws a yellow rectangle at (210, 85) with width 47 and height 76.
; PLAN: r0=210(x), r1=85(y), r2=47(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 85
LDI r2, 47
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
