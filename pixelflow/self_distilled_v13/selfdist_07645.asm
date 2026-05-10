; DESCRIPTION: Draws a red rectangle at (351, 34) with width 48 and height 41.
; PLAN: r0=351(x), r1=34(y), r2=48(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 34
LDI r2, 48
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
