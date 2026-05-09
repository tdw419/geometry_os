; DESCRIPTION: Draws a white rectangle at (61, 128) with width 84 and height 111.
; PLAN: r0=61(x), r1=128(y), r2=84(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 128
LDI r2, 84
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
