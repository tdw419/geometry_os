; DESCRIPTION: Draws a white rectangle at (64, 115) with width 112 and height 111.
; PLAN: r0=64(x), r1=115(y), r2=112(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 115
LDI r2, 112
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
