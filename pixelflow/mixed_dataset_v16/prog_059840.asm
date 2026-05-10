; DESCRIPTION: Creates a black rectangular region at (231, 79) spanning 70 by 30 pixels.
; PLAN: r0=231(x), r1=79(y), r2=70(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 79
LDI r2, 70
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
