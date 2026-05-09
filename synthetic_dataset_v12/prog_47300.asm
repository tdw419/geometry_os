; DESCRIPTION: Draws a white rectangle at (12, 82) with width 63 and height 101.
; PLAN: r0=12(x), r1=82(y), r2=63(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 82
LDI r2, 63
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
