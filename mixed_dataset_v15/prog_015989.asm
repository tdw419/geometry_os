; DESCRIPTION: Creates a black rectangular region at (141, 207) spanning 87 by 13 pixels.
; PLAN: r0=141(x), r1=207(y), r2=87(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 207
LDI r2, 87
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
