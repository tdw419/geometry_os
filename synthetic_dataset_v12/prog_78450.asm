; DESCRIPTION: Draws a blue rectangle at (439, 120) with width 72 and height 41.
; PLAN: r0=439(x), r1=120(y), r2=72(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 120
LDI r2, 72
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
