; DESCRIPTION: Draws a green rectangle at (63, 18) with width 120 and height 55.
; PLAN: r0=63(x), r1=18(y), r2=120(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 18
LDI r2, 120
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
