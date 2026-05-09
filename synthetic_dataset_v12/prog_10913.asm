; DESCRIPTION: Draws a red rectangle at (128, 112) with width 41 and height 106.
; PLAN: r0=128(x), r1=112(y), r2=41(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 112
LDI r2, 41
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
