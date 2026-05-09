; DESCRIPTION: Creates a red rectangular region at (403, 102) spanning 41 by 95 pixels.
; PLAN: r0=403(x), r1=102(y), r2=41(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 102
LDI r2, 41
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
