; DESCRIPTION: Creates a black rectangular region at (322, 141) spanning 54 by 85 pixels.
; PLAN: r0=322(x), r1=141(y), r2=54(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 141
LDI r2, 54
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
