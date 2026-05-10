; DESCRIPTION: Draws a white rectangle at (236, 1) with width 42 and height 50.
; PLAN: r0=236(x), r1=1(y), r2=42(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 1
LDI r2, 42
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
