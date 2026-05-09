; DESCRIPTION: Creates a red rectangular region at (374, 191) spanning 53 by 53 pixels.
; PLAN: r0=374(x), r1=191(y), r2=53(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 191
LDI r2, 53
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
