; DESCRIPTION: Draws a orange rectangle at (204, 153) with width 60 and height 38.
; PLAN: r0=204(x), r1=153(y), r2=60(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 153
LDI r2, 60
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
