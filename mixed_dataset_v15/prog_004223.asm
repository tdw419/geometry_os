; DESCRIPTION: Creates a red rectangular region at (157, 30) spanning 34 by 85 pixels.
; PLAN: r0=157(x), r1=30(y), r2=34(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 30
LDI r2, 34
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
