; DESCRIPTION: Draws a white rectangle at (402, 91) with width 57 and height 32.
; PLAN: r0=402(x), r1=91(y), r2=57(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 91
LDI r2, 57
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
