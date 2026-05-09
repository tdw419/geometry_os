; DESCRIPTION: Draws a white rectangle at (3, 73) with width 24 and height 98.
; PLAN: r0=3(x), r1=73(y), r2=24(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 73
LDI r2, 24
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
