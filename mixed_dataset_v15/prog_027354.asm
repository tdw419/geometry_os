; DESCRIPTION: Draws a blue rectangle at (277, 82) with width 43 and height 41.
; PLAN: r0=277(x), r1=82(y), r2=43(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 82
LDI r2, 43
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
