; DESCRIPTION: Draws a blue rectangle at (252, 98) with width 109 and height 93.
; PLAN: r0=252(x), r1=98(y), r2=109(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 98
LDI r2, 109
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
