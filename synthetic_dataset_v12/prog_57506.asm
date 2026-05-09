; DESCRIPTION: Draws a black rectangle at (353, 48) with width 16 and height 62.
; PLAN: r0=353(x), r1=48(y), r2=16(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 48
LDI r2, 16
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
