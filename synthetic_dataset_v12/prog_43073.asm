; DESCRIPTION: Creates a red rectangular region at (53, 116) spanning 65 by 92 pixels.
; PLAN: r0=53(x), r1=116(y), r2=65(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 116
LDI r2, 65
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
