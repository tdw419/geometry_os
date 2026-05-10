; DESCRIPTION: Draws a white rectangle at (409, 177) with width 101 and height 42.
; PLAN: r0=409(x), r1=177(y), r2=101(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 177
LDI r2, 101
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
