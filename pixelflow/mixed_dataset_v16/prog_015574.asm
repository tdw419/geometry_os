; DESCRIPTION: Creates a red rectangular region at (314, 121) spanning 21 by 110 pixels.
; PLAN: r0=314(x), r1=121(y), r2=21(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 121
LDI r2, 21
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
