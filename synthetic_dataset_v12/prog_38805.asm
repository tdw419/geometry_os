; DESCRIPTION: Draws a white rectangle at (273, 150) with width 105 and height 98.
; PLAN: r0=273(x), r1=150(y), r2=105(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 150
LDI r2, 105
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
