; DESCRIPTION: Creates a red rectangular region at (364, 92) spanning 90 by 75 pixels.
; PLAN: r0=364(x), r1=92(y), r2=90(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 92
LDI r2, 90
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
