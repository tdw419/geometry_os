; DESCRIPTION: Draws a blue rectangle at (382, 127) with width 41 and height 45.
; PLAN: r0=382(x), r1=127(y), r2=41(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 127
LDI r2, 41
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
