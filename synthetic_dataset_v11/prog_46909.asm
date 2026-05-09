; DESCRIPTION: Draws a black rectangle at (31, 39) with width 34 and height 59.
; PLAN: r0=31(x), r1=39(y), r2=34(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 39
LDI r2, 34
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
