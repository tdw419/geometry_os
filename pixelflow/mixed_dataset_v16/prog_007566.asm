; DESCRIPTION: Draws a white rectangle at (161, 42) with width 61 and height 30.
; PLAN: r0=161(x), r1=42(y), r2=61(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 42
LDI r2, 61
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
