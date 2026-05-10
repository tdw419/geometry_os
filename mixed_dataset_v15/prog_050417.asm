; DESCRIPTION: Draws a white rectangle at (255, 117) with width 51 and height 50.
; PLAN: r0=255(x), r1=117(y), r2=51(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 117
LDI r2, 51
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
