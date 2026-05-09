; DESCRIPTION: Creates a red rectangular region at (116, 158) spanning 32 by 27 pixels.
; PLAN: r0=116(x), r1=158(y), r2=32(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 158
LDI r2, 32
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
