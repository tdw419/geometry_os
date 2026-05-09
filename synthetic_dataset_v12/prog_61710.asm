; DESCRIPTION: Draws a red rectangle at (42, 117) with width 108 and height 81.
; PLAN: r0=42(x), r1=117(y), r2=108(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 117
LDI r2, 108
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
