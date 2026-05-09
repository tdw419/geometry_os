; DESCRIPTION: Creates a red rectangular region at (139, 20) spanning 115 by 85 pixels.
; PLAN: r0=139(x), r1=20(y), r2=115(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 20
LDI r2, 115
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
