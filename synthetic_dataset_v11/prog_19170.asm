; DESCRIPTION: Draws a green rectangle at (83, 73) with width 42 and height 115.
; PLAN: r0=83(x), r1=73(y), r2=42(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 73
LDI r2, 42
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
