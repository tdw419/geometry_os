; DESCRIPTION: Creates a red rectangular region at (403, 158) spanning 72 by 46 pixels.
; PLAN: r0=403(x), r1=158(y), r2=72(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 158
LDI r2, 72
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
