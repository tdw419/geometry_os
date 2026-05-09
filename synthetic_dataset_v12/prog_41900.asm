; DESCRIPTION: Creates a red rectangular region at (1, 3) spanning 89 by 31 pixels.
; PLAN: r0=1(x), r1=3(y), r2=89(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 3
LDI r2, 89
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
