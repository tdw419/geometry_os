; DESCRIPTION: Creates a red rectangular region at (393, 123) spanning 74 by 50 pixels.
; PLAN: r0=393(x), r1=123(y), r2=74(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 123
LDI r2, 74
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
