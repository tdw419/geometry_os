; DESCRIPTION: Draws a blue rectangle at (361, 150) with width 115 and height 21.
; PLAN: r0=361(x), r1=150(y), r2=115(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 150
LDI r2, 115
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
