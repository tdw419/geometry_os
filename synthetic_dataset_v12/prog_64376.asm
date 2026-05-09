; DESCRIPTION: Creates a red rectangular region at (32, 46) spanning 88 by 33 pixels.
; PLAN: r0=32(x), r1=46(y), r2=88(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 46
LDI r2, 88
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
