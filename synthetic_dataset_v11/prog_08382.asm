; DESCRIPTION: Creates a black rectangular region at (69, 143) spanning 44 by 89 pixels.
; PLAN: r0=69(x), r1=143(y), r2=44(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 143
LDI r2, 44
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
