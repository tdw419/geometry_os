; DESCRIPTION: Draws a red rectangle at (64, 85) with width 55 and height 37.
; PLAN: r0=64(x), r1=85(y), r2=55(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 85
LDI r2, 55
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
