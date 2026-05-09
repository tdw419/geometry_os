; DESCRIPTION: Draws a yellow rectangle at (149, 184) with width 21 and height 56.
; PLAN: r0=149(x), r1=184(y), r2=21(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 184
LDI r2, 21
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
