; DESCRIPTION: Creates a red rectangular region at (131, 110) spanning 57 by 94 pixels.
; PLAN: r0=131(x), r1=110(y), r2=57(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 110
LDI r2, 57
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
