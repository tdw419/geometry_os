; DESCRIPTION: Creates a red rectangular region at (117, 139) spanning 101 by 29 pixels.
; PLAN: r0=117(x), r1=139(y), r2=101(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 139
LDI r2, 101
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
