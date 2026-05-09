; DESCRIPTION: Draws a white rectangle at (223, 45) with width 13 and height 75.
; PLAN: r0=223(x), r1=45(y), r2=13(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 45
LDI r2, 13
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
