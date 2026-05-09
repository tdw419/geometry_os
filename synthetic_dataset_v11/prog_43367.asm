; DESCRIPTION: Draws a yellow rectangle at (38, 48) with width 11 and height 68.
; PLAN: r0=38(x), r1=48(y), r2=11(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 48
LDI r2, 11
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
