; DESCRIPTION: Draws a white rectangle at (247, 98) with width 10 and height 62.
; PLAN: r0=247(x), r1=98(y), r2=10(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 98
LDI r2, 10
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
