; DESCRIPTION: Draws a blue rectangle at (439, 184) with width 46 and height 31.
; PLAN: r0=439(x), r1=184(y), r2=46(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 184
LDI r2, 46
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
