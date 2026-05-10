; DESCRIPTION: Creates a green rectangular region at (141, 87) spanning 53 by 43 pixels.
; PLAN: r0=141(x), r1=87(y), r2=53(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 87
LDI r2, 53
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
