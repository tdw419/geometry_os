; DESCRIPTION: Creates a black rectangular region at (93, 146) spanning 71 by 92 pixels.
; PLAN: r0=93(x), r1=146(y), r2=71(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 146
LDI r2, 71
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
