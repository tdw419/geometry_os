; DESCRIPTION: Draws a white rectangle at (32, 188) with width 46 and height 31.
; PLAN: r0=32(x), r1=188(y), r2=46(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 188
LDI r2, 46
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
