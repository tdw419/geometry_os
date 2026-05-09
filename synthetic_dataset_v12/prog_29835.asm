; DESCRIPTION: Creates a red rectangular region at (304, 135) spanning 99 by 110 pixels.
; PLAN: r0=304(x), r1=135(y), r2=99(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 135
LDI r2, 99
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
