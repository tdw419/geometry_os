; DESCRIPTION: Creates a blue rectangular region at (281, 128) spanning 80 by 101 pixels.
; PLAN: r0=281(x), r1=128(y), r2=80(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 128
LDI r2, 80
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
