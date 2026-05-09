; DESCRIPTION: Creates a black rectangular region at (71, 133) spanning 89 by 93 pixels.
; PLAN: r0=71(x), r1=133(y), r2=89(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 133
LDI r2, 89
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
