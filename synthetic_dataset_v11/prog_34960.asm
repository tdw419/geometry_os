; DESCRIPTION: Creates a red rectangular region at (96, 62) spanning 92 by 104 pixels.
; PLAN: r0=96(x), r1=62(y), r2=92(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 62
LDI r2, 92
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
