; DESCRIPTION: Draws a white rectangle at (181, 59) with width 42 and height 20.
; PLAN: r0=181(x), r1=59(y), r2=42(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 59
LDI r2, 42
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
