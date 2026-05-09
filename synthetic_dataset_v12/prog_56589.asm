; DESCRIPTION: Draws a red rectangle at (77, 128) with width 41 and height 53.
; PLAN: r0=77(x), r1=128(y), r2=41(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 128
LDI r2, 41
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
