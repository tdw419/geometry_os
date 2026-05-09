; DESCRIPTION: Draws a white rectangle at (38, 127) with width 52 and height 61.
; PLAN: r0=38(x), r1=127(y), r2=52(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 127
LDI r2, 52
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
