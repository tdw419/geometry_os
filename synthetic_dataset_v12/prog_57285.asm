; DESCRIPTION: Creates a red rectangular region at (31, 46) spanning 76 by 37 pixels.
; PLAN: r0=31(x), r1=46(y), r2=76(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 46
LDI r2, 76
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
