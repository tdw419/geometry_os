; DESCRIPTION: Creates a red rectangular region at (76, 92) spanning 48 by 79 pixels.
; PLAN: r0=76(x), r1=92(y), r2=48(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 92
LDI r2, 48
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
