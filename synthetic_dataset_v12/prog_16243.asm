; DESCRIPTION: Draws a white rectangle at (195, 141) with width 64 and height 113.
; PLAN: r0=195(x), r1=141(y), r2=64(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 141
LDI r2, 64
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
