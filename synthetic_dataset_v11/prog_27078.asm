; DESCRIPTION: Creates a red rectangular region at (0, 23) spanning 89 by 88 pixels.
; PLAN: r0=0(x), r1=23(y), r2=89(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 23
LDI r2, 89
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
