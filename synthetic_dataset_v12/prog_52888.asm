; DESCRIPTION: Creates a red rectangular region at (47, 126) spanning 100 by 30 pixels.
; PLAN: r0=47(x), r1=126(y), r2=100(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 126
LDI r2, 100
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
