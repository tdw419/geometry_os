; DESCRIPTION: Creates a red rectangular region at (205, 139) spanning 48 by 47 pixels.
; PLAN: r0=205(x), r1=139(y), r2=48(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 139
LDI r2, 48
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
