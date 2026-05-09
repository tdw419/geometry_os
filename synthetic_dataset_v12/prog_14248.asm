; DESCRIPTION: Draws a white rectangle at (382, 149) with width 58 and height 62.
; PLAN: r0=382(x), r1=149(y), r2=58(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 149
LDI r2, 58
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
