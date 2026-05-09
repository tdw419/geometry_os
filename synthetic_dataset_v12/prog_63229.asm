; DESCRIPTION: Draws a white rectangle at (198, 185) with width 102 and height 48.
; PLAN: r0=198(x), r1=185(y), r2=102(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 185
LDI r2, 102
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
