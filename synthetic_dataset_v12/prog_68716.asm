; DESCRIPTION: Draws a blue rectangle at (273, 5) with width 41 and height 32.
; PLAN: r0=273(x), r1=5(y), r2=41(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 5
LDI r2, 41
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
