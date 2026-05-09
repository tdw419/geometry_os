; DESCRIPTION: Draws a black rectangle at (403, 86) with width 100 and height 35.
; PLAN: r0=403(x), r1=86(y), r2=100(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 86
LDI r2, 100
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
