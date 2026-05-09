; DESCRIPTION: Creates a yellow rectangular region at (109, 69) spanning 64 by 46 pixels.
; PLAN: r0=109(x), r1=69(y), r2=64(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 69
LDI r2, 64
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
