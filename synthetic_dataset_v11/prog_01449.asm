; DESCRIPTION: Creates a red rectangular region at (64, 60) spanning 85 by 102 pixels.
; PLAN: r0=64(x), r1=60(y), r2=85(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 60
LDI r2, 85
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
