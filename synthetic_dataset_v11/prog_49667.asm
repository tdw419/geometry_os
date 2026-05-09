; DESCRIPTION: Creates a blue rectangular region at (26, 128) spanning 75 by 50 pixels.
; PLAN: r0=26(x), r1=128(y), r2=75(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 128
LDI r2, 75
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
