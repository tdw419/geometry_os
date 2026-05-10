; DESCRIPTION: Draws a blue rectangle at (231, 121) with width 97 and height 87.
; PLAN: r0=231(x), r1=121(y), r2=97(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 121
LDI r2, 97
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
