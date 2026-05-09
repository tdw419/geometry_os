; DESCRIPTION: Draws a white rectangle at (1, 42) with width 45 and height 21.
; PLAN: r0=1(x), r1=42(y), r2=45(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 42
LDI r2, 45
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
