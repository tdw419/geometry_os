; DESCRIPTION: Places a blue 43x25 rectangle at position (432, 217).
; PLAN: r0=432(x), r1=217(y), r2=43(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 217
LDI r2, 43
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
