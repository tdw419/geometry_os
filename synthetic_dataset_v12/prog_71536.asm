; DESCRIPTION: Draws a red rectangle at (289, 88) with width 42 and height 52.
; PLAN: r0=289(x), r1=88(y), r2=42(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 88
LDI r2, 42
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
