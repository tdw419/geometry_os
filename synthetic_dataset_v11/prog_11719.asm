; DESCRIPTION: Draws a green rectangle at (8, 142) with width 50 and height 21.
; PLAN: r0=8(x), r1=142(y), r2=50(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 142
LDI r2, 50
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
