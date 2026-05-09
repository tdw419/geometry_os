; DESCRIPTION: Creates a red rectangular region at (50, 123) spanning 115 by 45 pixels.
; PLAN: r0=50(x), r1=123(y), r2=115(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 123
LDI r2, 115
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
