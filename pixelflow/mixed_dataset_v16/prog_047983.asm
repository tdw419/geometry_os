; DESCRIPTION: Draws a orange rectangle at (126, 82) with width 95 and height 62.
; PLAN: r0=126(x), r1=82(y), r2=95(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 82
LDI r2, 95
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
