; DESCRIPTION: Creates a blue rectangular region at (231, 9) spanning 16 by 65 pixels.
; PLAN: r0=231(x), r1=9(y), r2=16(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 9
LDI r2, 16
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
