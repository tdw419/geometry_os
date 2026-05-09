; DESCRIPTION: Draws a white rectangle at (234, 86) with width 54 and height 45.
; PLAN: r0=234(x), r1=86(y), r2=54(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 86
LDI r2, 54
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
