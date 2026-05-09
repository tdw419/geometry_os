; DESCRIPTION: Creates a red rectangular region at (93, 80) spanning 72 by 68 pixels.
; PLAN: r0=93(x), r1=80(y), r2=72(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 80
LDI r2, 72
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
