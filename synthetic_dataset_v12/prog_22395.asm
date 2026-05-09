; DESCRIPTION: Draws a white rectangle at (220, 78) with width 57 and height 68.
; PLAN: r0=220(x), r1=78(y), r2=57(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 78
LDI r2, 57
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
