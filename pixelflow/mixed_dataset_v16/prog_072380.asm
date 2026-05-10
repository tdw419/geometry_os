; DESCRIPTION: Draws a red rectangle at (173, 127) with width 41 and height 72.
; PLAN: r0=173(x), r1=127(y), r2=41(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 127
LDI r2, 41
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
