; DESCRIPTION: Draws a red rectangle at (24, 148) with width 100 and height 42.
; PLAN: r0=24(x), r1=148(y), r2=100(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 148
LDI r2, 100
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
