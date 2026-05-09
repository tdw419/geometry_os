; DESCRIPTION: Draws a white rectangle at (31, 98) with width 42 and height 14.
; PLAN: r0=31(x), r1=98(y), r2=42(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 98
LDI r2, 42
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
