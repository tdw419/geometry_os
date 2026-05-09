; DESCRIPTION: Creates a red rectangular region at (117, 62) spanning 109 by 76 pixels.
; PLAN: r0=117(x), r1=62(y), r2=109(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 62
LDI r2, 109
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
