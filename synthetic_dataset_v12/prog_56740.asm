; DESCRIPTION: Draws a red rectangle at (119, 29) with width 42 and height 117.
; PLAN: r0=119(x), r1=29(y), r2=42(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 29
LDI r2, 42
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
