; DESCRIPTION: Draws a red rectangle at (42, 115) with width 49 and height 62.
; PLAN: r0=42(x), r1=115(y), r2=49(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 115
LDI r2, 49
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
