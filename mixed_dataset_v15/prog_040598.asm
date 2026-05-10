; DESCRIPTION: Creates a green rectangular region at (123, 61) spanning 100 by 46 pixels.
; PLAN: r0=123(x), r1=61(y), r2=100(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 61
LDI r2, 100
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
