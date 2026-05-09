; DESCRIPTION: Draws a white rectangle at (203, 27) with width 14 and height 10.
; PLAN: r0=203(x), r1=27(y), r2=14(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 27
LDI r2, 14
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
