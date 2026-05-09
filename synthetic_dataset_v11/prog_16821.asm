; DESCRIPTION: Creates a red rectangular region at (131, 139) spanning 39 by 76 pixels.
; PLAN: r0=131(x), r1=139(y), r2=39(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 139
LDI r2, 39
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
