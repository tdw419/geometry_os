; DESCRIPTION: Draws a red rectangle at (82, 81) with width 15 and height 42.
; PLAN: r0=82(x), r1=81(y), r2=15(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 81
LDI r2, 15
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
