; DESCRIPTION: Creates a yellow rectangular region at (458, 79) spanning 34 by 13 pixels.
; PLAN: r0=458(x), r1=79(y), r2=34(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 79
LDI r2, 34
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
