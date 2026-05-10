; DESCRIPTION: Draws a white rectangle at (88, 196) with width 27 and height 75.
; PLAN: r0=88(x), r1=196(y), r2=27(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 196
LDI r2, 27
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
