; DESCRIPTION: Draws a white rectangle at (302, 17) with width 42 and height 97.
; PLAN: r0=302(x), r1=17(y), r2=42(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 17
LDI r2, 42
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
