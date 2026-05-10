; DESCRIPTION: Draws a red rectangle at (95, 128) with width 21 and height 118.
; PLAN: r0=95(x), r1=128(y), r2=21(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 128
LDI r2, 21
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
