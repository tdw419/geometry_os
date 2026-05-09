; DESCRIPTION: Creates a red rectangular region at (338, 100) spanning 47 by 85 pixels.
; PLAN: r0=338(x), r1=100(y), r2=47(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 100
LDI r2, 47
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
