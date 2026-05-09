; DESCRIPTION: Draws a white rectangle at (50, 82) with width 99 and height 76.
; PLAN: r0=50(x), r1=82(y), r2=99(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 82
LDI r2, 99
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
