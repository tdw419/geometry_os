; DESCRIPTION: Draws a purple rectangle at (275, 111) with width 41 and height 37.
; PLAN: r0=275(x), r1=111(y), r2=41(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 111
LDI r2, 41
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
