; DESCRIPTION: Creates a red rectangular region at (246, 78) spanning 120 by 73 pixels.
; PLAN: r0=246(x), r1=78(y), r2=120(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 78
LDI r2, 120
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
