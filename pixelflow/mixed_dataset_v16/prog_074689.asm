; DESCRIPTION: Draws a black rectangle at (136, 171) with width 28 and height 16.
; PLAN: r0=136(x), r1=171(y), r2=28(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 171
LDI r2, 28
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
