; DESCRIPTION: Draws a green rectangle at (76, 63) with width 12 and height 120.
; PLAN: r0=76(x), r1=63(y), r2=12(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 63
LDI r2, 12
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
