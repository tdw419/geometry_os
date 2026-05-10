; DESCRIPTION: Draws a white rectangle at (367, 68) with width 73 and height 99.
; PLAN: r0=367(x), r1=68(y), r2=73(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 68
LDI r2, 73
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
