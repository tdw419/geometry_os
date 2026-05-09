; DESCRIPTION: Draws a white rectangle at (212, 5) with width 113 and height 80.
; PLAN: r0=212(x), r1=5(y), r2=113(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 5
LDI r2, 113
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
