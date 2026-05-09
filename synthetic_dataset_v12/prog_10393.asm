; DESCRIPTION: Draws a blue rectangle at (368, 134) with width 107 and height 47.
; PLAN: r0=368(x), r1=134(y), r2=107(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 134
LDI r2, 107
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
