; DESCRIPTION: Draws a red rectangle at (126, 76) with width 18 and height 18.
; PLAN: r0=126(x), r1=76(y), r2=18(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 76
LDI r2, 18
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
