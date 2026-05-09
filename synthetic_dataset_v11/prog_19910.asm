; DESCRIPTION: Draws a black rectangle at (90, 68) with width 24 and height 70.
; PLAN: r0=90(x), r1=68(y), r2=24(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 68
LDI r2, 24
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
