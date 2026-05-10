; DESCRIPTION: Draws a red rectangle at (67, 93) with width 11 and height 95.
; PLAN: r0=67(x), r1=93(y), r2=11(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 93
LDI r2, 11
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
