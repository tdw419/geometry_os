; DESCRIPTION: Draws a green rectangle at (42, 108) with width 102 and height 12.
; PLAN: r0=42(x), r1=108(y), r2=102(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 108
LDI r2, 102
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
