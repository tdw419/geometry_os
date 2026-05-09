; DESCRIPTION: Draws a white rectangle at (11, 42) with width 73 and height 31.
; PLAN: r0=11(x), r1=42(y), r2=73(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 42
LDI r2, 73
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
