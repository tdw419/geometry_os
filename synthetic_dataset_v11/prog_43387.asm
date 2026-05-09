; DESCRIPTION: Creates a red rectangular region at (123, 20) spanning 118 by 70 pixels.
; PLAN: r0=123(x), r1=20(y), r2=118(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 20
LDI r2, 118
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
