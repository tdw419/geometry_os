; DESCRIPTION: Draws a white rectangle at (395, 23) with width 63 and height 91.
; PLAN: r0=395(x), r1=23(y), r2=63(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 23
LDI r2, 63
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
