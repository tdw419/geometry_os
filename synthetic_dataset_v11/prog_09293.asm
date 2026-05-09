; DESCRIPTION: Draws a red rectangle at (42, 155) with width 96 and height 48.
; PLAN: r0=42(x), r1=155(y), r2=96(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 155
LDI r2, 96
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
