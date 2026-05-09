; DESCRIPTION: Creates a blue rectangular region at (231, 81) spanning 24 by 80 pixels.
; PLAN: r0=231(x), r1=81(y), r2=24(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 81
LDI r2, 24
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
