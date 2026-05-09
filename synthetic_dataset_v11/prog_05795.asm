; DESCRIPTION: Draws a red rectangle at (141, 28) with width 42 and height 26.
; PLAN: r0=141(x), r1=28(y), r2=42(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 28
LDI r2, 42
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
