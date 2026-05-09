; DESCRIPTION: Draws a red rectangle at (353, 14) with width 42 and height 39.
; PLAN: r0=353(x), r1=14(y), r2=42(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 14
LDI r2, 42
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
