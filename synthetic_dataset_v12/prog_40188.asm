; DESCRIPTION: Creates a yellow rectangular region at (189, 5) spanning 62 by 115 pixels.
; PLAN: r0=189(x), r1=5(y), r2=62(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 5
LDI r2, 62
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
