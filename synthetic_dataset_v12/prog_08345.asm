; DESCRIPTION: Draws a yellow rectangle at (184, 186) with width 24 and height 62.
; PLAN: r0=184(x), r1=186(y), r2=24(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 186
LDI r2, 24
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
