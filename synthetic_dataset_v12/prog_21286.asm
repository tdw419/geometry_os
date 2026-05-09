; DESCRIPTION: Draws a green rectangle at (429, 41) with width 48 and height 90.
; PLAN: r0=429(x), r1=41(y), r2=48(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 41
LDI r2, 48
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
