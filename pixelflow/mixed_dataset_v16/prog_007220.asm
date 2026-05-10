; DESCRIPTION: Creates a red rectangular region at (158, 190) spanning 71 by 64 pixels.
; PLAN: r0=158(x), r1=190(y), r2=71(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 190
LDI r2, 71
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
