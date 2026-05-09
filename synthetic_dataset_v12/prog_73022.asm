; DESCRIPTION: Draws a green rectangle at (62, 128) with width 28 and height 120.
; PLAN: r0=62(x), r1=128(y), r2=28(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 128
LDI r2, 28
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
