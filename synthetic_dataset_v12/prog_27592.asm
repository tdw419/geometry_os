; DESCRIPTION: Creates a red rectangular region at (123, 14) spanning 107 by 34 pixels.
; PLAN: r0=123(x), r1=14(y), r2=107(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 14
LDI r2, 107
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
