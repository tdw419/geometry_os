; DESCRIPTION: Draws a white rectangle at (98, 75) with width 91 and height 91.
; PLAN: r0=98(x), r1=75(y), r2=91(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 75
LDI r2, 91
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
