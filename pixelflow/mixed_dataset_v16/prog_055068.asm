; DESCRIPTION: Draws a white rectangle at (229, 91) with width 84 and height 27.
; PLAN: r0=229(x), r1=91(y), r2=84(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 91
LDI r2, 84
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
