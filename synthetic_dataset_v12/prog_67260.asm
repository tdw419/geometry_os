; DESCRIPTION: Draws a white rectangle at (272, 73) with width 94 and height 62.
; PLAN: r0=272(x), r1=73(y), r2=94(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 73
LDI r2, 94
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
