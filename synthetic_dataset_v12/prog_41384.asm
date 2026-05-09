; DESCRIPTION: Creates a yellow rectangular region at (407, 223) spanning 46 by 23 pixels.
; PLAN: r0=407(x), r1=223(y), r2=46(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 223
LDI r2, 46
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
