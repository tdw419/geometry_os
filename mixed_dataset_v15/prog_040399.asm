; DESCRIPTION: Creates a black rectangular region at (326, 98) spanning 84 by 87 pixels.
; PLAN: r0=326(x), r1=98(y), r2=84(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 98
LDI r2, 84
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
