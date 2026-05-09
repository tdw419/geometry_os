; DESCRIPTION: Creates a red rectangular region at (92, 34) spanning 50 by 101 pixels.
; PLAN: r0=92(x), r1=34(y), r2=50(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 34
LDI r2, 50
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
