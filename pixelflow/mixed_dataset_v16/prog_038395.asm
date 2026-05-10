; DESCRIPTION: Draws a white rectangle at (91, 157) with width 34 and height 98.
; PLAN: r0=91(x), r1=157(y), r2=34(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 157
LDI r2, 34
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
