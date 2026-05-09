; DESCRIPTION: Creates a red rectangular region at (238, 191) spanning 72 by 23 pixels.
; PLAN: r0=238(x), r1=191(y), r2=72(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 191
LDI r2, 72
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
