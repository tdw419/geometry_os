; DESCRIPTION: Creates a blue rectangular region at (231, 87) spanning 67 by 70 pixels.
; PLAN: r0=231(x), r1=87(y), r2=67(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 87
LDI r2, 67
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
