; DESCRIPTION: Creates a yellow rectangular region at (379, 23) spanning 46 by 10 pixels.
; PLAN: r0=379(x), r1=23(y), r2=46(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 23
LDI r2, 46
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
