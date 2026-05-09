; DESCRIPTION: Creates a red rectangular region at (122, 182) spanning 102 by 15 pixels.
; PLAN: r0=122(x), r1=182(y), r2=102(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 182
LDI r2, 102
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
