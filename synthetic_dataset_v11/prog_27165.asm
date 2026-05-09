; DESCRIPTION: Draws a black rectangle at (206, 16) with width 24 and height 47.
; PLAN: r0=206(x), r1=16(y), r2=24(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 16
LDI r2, 24
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
