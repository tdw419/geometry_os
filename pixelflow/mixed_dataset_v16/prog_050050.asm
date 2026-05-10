; DESCRIPTION: Draws a white rectangle at (137, 111) with width 50 and height 57.
; PLAN: r0=137(x), r1=111(y), r2=50(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 111
LDI r2, 50
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
