; DESCRIPTION: Draws a white rectangle at (219, 124) with width 36 and height 50.
; PLAN: r0=219(x), r1=124(y), r2=36(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 124
LDI r2, 36
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
