; DESCRIPTION: Draws a red rectangle at (54, 204) with width 62 and height 22.
; PLAN: r0=54(x), r1=204(y), r2=62(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 204
LDI r2, 62
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
