; DESCRIPTION: Creates a black rectangular region at (231, 141) spanning 107 by 55 pixels.
; PLAN: r0=231(x), r1=141(y), r2=107(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 141
LDI r2, 107
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
