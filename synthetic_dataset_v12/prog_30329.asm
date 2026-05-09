; DESCRIPTION: Draws a white rectangle at (12, 50) with width 50 and height 71.
; PLAN: r0=12(x), r1=50(y), r2=50(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 50
LDI r2, 50
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
