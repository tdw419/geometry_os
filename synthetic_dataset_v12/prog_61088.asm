; DESCRIPTION: Draws a white rectangle at (120, 127) with width 49 and height 31.
; PLAN: r0=120(x), r1=127(y), r2=49(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 127
LDI r2, 49
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
