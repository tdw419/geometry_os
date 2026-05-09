; DESCRIPTION: Draws a white rectangle at (328, 91) with width 91 and height 63.
; PLAN: r0=328(x), r1=91(y), r2=91(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 91
LDI r2, 91
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
