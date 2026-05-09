; DESCRIPTION: Draws a white rectangle at (174, 113) with width 111 and height 112.
; PLAN: r0=174(x), r1=113(y), r2=111(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 113
LDI r2, 111
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
