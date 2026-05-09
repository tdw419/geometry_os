; DESCRIPTION: Draws a green rectangle at (55, 19) with width 42 and height 31.
; PLAN: r0=55(x), r1=19(y), r2=42(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 19
LDI r2, 42
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
