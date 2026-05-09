; DESCRIPTION: Creates a red rectangular region at (71, 26) spanning 92 by 11 pixels.
; PLAN: r0=71(x), r1=26(y), r2=92(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 26
LDI r2, 92
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
