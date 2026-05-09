; DESCRIPTION: Draws a white rectangle at (166, 53) with width 87 and height 75.
; PLAN: r0=166(x), r1=53(y), r2=87(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 53
LDI r2, 87
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
