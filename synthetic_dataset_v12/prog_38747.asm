; DESCRIPTION: Draws a white rectangle at (288, 23) with width 54 and height 27.
; PLAN: r0=288(x), r1=23(y), r2=54(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 23
LDI r2, 54
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
