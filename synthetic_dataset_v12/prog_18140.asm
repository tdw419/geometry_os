; DESCRIPTION: Draws a white rectangle at (351, 121) with width 109 and height 58.
; PLAN: r0=351(x), r1=121(y), r2=109(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 121
LDI r2, 109
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
