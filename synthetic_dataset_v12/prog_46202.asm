; DESCRIPTION: Draws a white rectangle at (140, 83) with width 75 and height 16.
; PLAN: r0=140(x), r1=83(y), r2=75(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 83
LDI r2, 75
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
