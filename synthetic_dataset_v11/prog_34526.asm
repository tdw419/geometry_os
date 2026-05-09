; DESCRIPTION: Draws a white rectangle at (31, 192) with width 71 and height 50.
; PLAN: r0=31(x), r1=192(y), r2=71(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 192
LDI r2, 71
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
