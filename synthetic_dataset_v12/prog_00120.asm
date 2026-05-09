; DESCRIPTION: Draws a white rectangle at (359, 46) with width 32 and height 120.
; PLAN: r0=359(x), r1=46(y), r2=32(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 46
LDI r2, 32
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
