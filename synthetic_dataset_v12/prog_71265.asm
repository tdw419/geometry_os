; DESCRIPTION: Draws a black rectangle at (336, 115) with width 109 and height 95.
; PLAN: r0=336(x), r1=115(y), r2=109(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 115
LDI r2, 109
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
