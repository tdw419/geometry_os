; DESCRIPTION: Draws a white rectangle at (335, 16) with width 44 and height 115.
; PLAN: r0=335(x), r1=16(y), r2=44(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 16
LDI r2, 44
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
