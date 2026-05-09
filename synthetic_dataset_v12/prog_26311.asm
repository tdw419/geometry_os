; DESCRIPTION: Creates a red rectangular region at (116, 0) spanning 54 by 30 pixels.
; PLAN: r0=116(x), r1=0(y), r2=54(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 0
LDI r2, 54
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
