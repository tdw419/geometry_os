; DESCRIPTION: Creates a red rectangular region at (75, 216) spanning 86 by 34 pixels.
; PLAN: r0=75(x), r1=216(y), r2=86(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 216
LDI r2, 86
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
