; DESCRIPTION: Draws a yellow rectangle at (30, 16) with width 49 and height 38.
; PLAN: r0=30(x), r1=16(y), r2=49(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 16
LDI r2, 49
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
