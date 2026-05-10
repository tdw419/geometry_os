; DESCRIPTION: Draws a orange rectangle at (237, 85) with width 43 and height 93.
; PLAN: r0=237(x), r1=85(y), r2=43(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 85
LDI r2, 43
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
