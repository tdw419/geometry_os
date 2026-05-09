; DESCRIPTION: Draws a green rectangle at (410, 128) with width 84 and height 106.
; PLAN: r0=410(x), r1=128(y), r2=84(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 128
LDI r2, 84
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
