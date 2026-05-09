; DESCRIPTION: Creates a white rectangular region at (101, 74) spanning 85 by 35 pixels.
; PLAN: r0=101(x), r1=74(y), r2=85(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 74
LDI r2, 85
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
