; DESCRIPTION: Draws a red rectangle at (361, 113) with width 63 and height 95.
; PLAN: r0=361(x), r1=113(y), r2=63(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 113
LDI r2, 63
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
