; DESCRIPTION: Draws a white rectangle at (150, 181) with width 14 and height 42.
; PLAN: r0=150(x), r1=181(y), r2=14(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 181
LDI r2, 14
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
