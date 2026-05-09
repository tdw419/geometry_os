; DESCRIPTION: Draws a black rectangle at (61, 34) with width 20 and height 108.
; PLAN: r0=61(x), r1=34(y), r2=20(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 34
LDI r2, 20
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
