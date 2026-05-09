; DESCRIPTION: Draws a yellow rectangle at (78, 62) with width 16 and height 50.
; PLAN: r0=78(x), r1=62(y), r2=16(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 62
LDI r2, 16
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
