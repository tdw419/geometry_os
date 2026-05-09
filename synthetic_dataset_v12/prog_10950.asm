; DESCRIPTION: Draws a white rectangle at (402, 165) with width 61 and height 83.
; PLAN: r0=402(x), r1=165(y), r2=61(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 165
LDI r2, 61
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
