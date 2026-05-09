; DESCRIPTION: Draws a white rectangle at (335, 11) with width 13 and height 32.
; PLAN: r0=335(x), r1=11(y), r2=13(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 11
LDI r2, 13
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
