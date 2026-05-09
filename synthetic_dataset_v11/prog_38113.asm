; DESCRIPTION: Creates a red rectangular region at (99, 23) spanning 110 by 20 pixels.
; PLAN: r0=99(x), r1=23(y), r2=110(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 23
LDI r2, 110
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
