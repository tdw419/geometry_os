; DESCRIPTION: Draws a white rectangle at (113, 112) with width 83 and height 117.
; PLAN: r0=113(x), r1=112(y), r2=83(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 112
LDI r2, 83
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
